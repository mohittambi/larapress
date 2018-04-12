<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use JWTAuth;
use App\User;
use App\Model\UserDevice;
use App\Model\SocialAccount;
use JWTAuthException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use DB;

class UserController extends Controller
{   

    private $uploadsfolder;
    public function __construct()
    { 
        $this->uploadsfolder = asset('public/uploads/');    
    }


    public function getApiKey(Request $request)
    {
        $credentials = $request->only('email', 'password');
        $token = null;
        try {
           if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['invalid_email_or_password'], 422);
           }
        } catch (JWTAuthException $e) {
            return response()->json(['failed_to_create_token'], 500);
        }
        return response()->json(compact('token'));
    }



    public function signup(Request $request)
    {
        $validator = Validator::make($request->all(), [
                        
                        'full_name' => 'required|max:255',
                        'email' => 'required|email|max:255|unique:users',
                        'password' => 'required|max:50|min:6',
                        'device_type'=>'required',
                        'device_id'=>'required'
                       
                    ]);
        if ($validator->fails()) 
        {
            $error = $this->validationHandle($validator->messages()); 
            return response()->json(['status'=>false,'message'=>$error]);
        }
        else
        {
            $row = new User();
            $row->username= $request->email;
            $row->full_name= $request->full_name;
            $row->email=$request->email;
            $row->password = bcrypt($request->password);
            $row->status = 1;

            if($request->file('profile_pic'))
            {
                $file = $request->file('profile_pic');
                $image = uploadwithresize($file,'users');
                $row->image= $image;
            }
            $row->save();
            $this->manageDeviceIdAndToken($row->id,$request->device_id,$request->device_type,'add');
            if(isset($request->social_id) && $request->social_id != "" && isset($request->social_type) && $request->social_type != "")
            {
                $this->manageSocialAccounts($row->id,$request->social_id,$request->social_type);
            }
            $user = $this->getuserdetailfromObjectArray($row);
            return response()->json(['status'=>true,'message'=>'Registration successfully','data'=>$user]);
        }
    }

    public function updateProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
                        'user_id' => 'required',
                        'full_name'=>'required',
                        
                       'email' => 'required|email|unique:users,email,' . $request->user_id,
                      
                    ]);
        if ($validator->fails()) 
        {
            $error = $this->validationHandle($validator->messages()); 
            return response()->json(['status'=>false,'message'=>$error]);
        }
        else
        {
            $row =  User::where('id',$request->user_id)->first();
            $previous_row = $row;
            $row->full_name= $request->full_name;
            $row->email=$request->email;
              if($request->file('profile_pic'))
                {
                    $file = $request->file('profile_pic');
                    $image = uploadwithresize($file,'users');
                   
                    if($previous_row->image)
                    {
                        unlinkfile('users',$previous_row->image);
                    }
                    $row->image= $image;
                   
                }
            $row->save();
            $user = $this->getuserdetailfromObjectArray($row);
            return response()->json(['status'=>true,'message'=>'Profile updated successfully','data'=>$user]);
        }
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
                        'username' => 'required',
                        'password' => 'required',
                        'device_type'=>'required',
                        'device_id'=>'required',
                    ]);
        if ($validator->fails()) 
        {
            $error = $this->validationHandle($validator->messages()); 
            return response()->json(['status'=>false,'message'=>$error]);
        }
        else
        {
            $user_name = $request->username;
            $password = bcrypt($request->password);
            $row = User::where('role','U') 
                    ->where(function($query) use ($user_name){
                        $query  ->where('email', $user_name);
                        $query->orWhere('username', $user_name);
                    })
                   
                    ->first();

            if ($row && Hash::check($request->password, $row->password)) 
            {
                if($row->status == '1')
                {
                    $user =  $this->getuserdetailfromObjectArray($row);

                    $this->manageDeviceIdAndToken($row->id,$request->device_id,$request->device_type,'add');               
                    return response()->json(['status'=>true,'message'=>'login successfully','data'=>$user]);
                }
                else
                {
                    return response()->json(['status'=>false,'message'=>'Your account is deactivated.']);
                }
                

            }
            else
            {
                return response()->json(['status'=>false,'message'=>'Invalid username or password']);
            }
            
        }
    }

    public function socialUserCheck(Request $request)
    {

        $validator = Validator::make($request->all(), [
                        'social_type' => 'required',
                        'social_id' => 'required',
                        'device_type'=>'required',
                        'device_id'=>'required',
                        
                    ]);
        if ($validator->fails()) 
        {
            $error = $this->validationHandle($validator->messages()); 
            return response()->json(['status'=>false,'message'=>$error]);
        }
        else
        {
            $social_row = SocialAccount::where('social_type',$request->social_type)->where('social_id',$request->social_id);
            if(isset($request->email) && $request->email !="")
            {
                $email = $request->email;
                $social_row = $social_row->whereHas('getAssociateUserWithSocial',function ($query) use($email) {  
                        $query->where('email', $email)
                        ->where('role', 'U')

                        ;
                    });
            }
            $social_row = $social_row->first();    
            if($social_row)
            {
                $row = $social_row->getAssociateUserWithSocial;
                $user =  $this->getuserdetailfromObjectArray($row);
                return response()->json(['status'=>true,"social"=>true,'message'=>'Social user detail','data'=>$user]);
            }
            else
            {

                 if(isset($request->email) && $request->email !="")
                 {
                    $user = User::where('email',$request->email)->first();
                    if($user)
                    {
                        $this->manageSocialAccounts($user->id,$request->social_id,$request->social_type);
                        $user =  $this->getuserdetailfromObjectArray($user);
                        return response()->json(['status'=>true,"social"=>true,'message'=>'Social user detail','data'=>$user]);
                    }
                    else
                    {
                        return response()->json(['status'=>true,"social"=>false,'message'=>'Do not have any social links']);
                    }

                 }
                else
                {
                    return response()->json(['status'=>true,"social"=>false,'message'=>'Do not have any social links']);
                }

               
            }
            
        }
    }

   public function forgotPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
                        'email' => 'required|email',
                    ]);
        if ($validator->fails()) 
        {
            $error = $this->validationHandle($validator->messages()); 
            return response()->json(['status'=>false,'message'=>$error]);
        }
        else
        {
            $row = User::where('role','U')
                    ->where('email', $request->email)
                    ->first();
            if($row)
            {
                $password_reset_token = strtotime(date('Y-m-d H:i:s')).rand(99,999);
                $password_reset_token =  bcrypt($password_reset_token);
                $row->password_reset_token = $password_reset_token;
                $row->save();
                $data=  array(
                    "email"=>$row->email,
                    "token"=>$password_reset_token
                    );
                mailSend($data);
                return response()->json(['status'=>true,'message'=>'Please check your email. System sent a change password request link to your email address']);
            }
            else
            {
                return response()->json(['status'=>false,'message'=>'Invalid email']);
            }

        }
    }

    public function manageSocialAccounts($user_id,$social_id,$social_type)
    {
        SocialAccount::updateOrCreate(
        ['social_id'=>$social_id,'social_type'=>$social_type],['user_id' => $user_id]
        ); 
    }

    public function manageDeviceIdAndToken($user_id,$device_id,$device_type,$methodName)
    {

        if($methodName =='add')
        {
             UserDevice::updateOrCreate(
                ['user_id' => $user_id,'device_id'=>$device_id,'device_type'=>$device_type]
                ); 
        }
        if($methodName=='delete')
        {
            UserDevice::where('user_id',$user_id)
            ->where('device_id',$device_id)
            ->where('device_type',$device_type)
            ->delete();
        }
    }



    public function getuserdetailfromObjectArray($row)
    {
       

        $user = (object)array(
                    'user_id'=>$row->id,
                    'full_name'=>$row->full_name,
                    'email'=>$row->email,
                    'profile_pic'=>$row->image?$this->uploadsfolder.'/users/'.$row->image:asset('images/user.png'),
                    'profile_pic_thumb'=>$row->image?$this->uploadsfolder.'/users/thumb/'.$row->image:asset('images/user.png'),
                   
                    'status'=>$row->status,
                   
                    'created_at'=> date('Y-m-d H:i',strtotime($row->created_at))
                );
        return $user;
    }

    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
                        'user_id' => 'required',
                        'currentPassword'=>'required',
                        'newPassword'=>'required'  
                    ]);
        if ($validator->fails()) 
        {
            $error = $this->validationHandle($validator->messages()); 
            return response()->json(['status'=>false,'message'=>$error]);
        }
        else
        {
            $row = User::whereId($request->user_id)->first();
            if (Hash::check($request->currentPassword, $row->password)) 
            {
                $row->password = bcrypt($request->newPassword);
                $row->save();
                return response()->json(['status'=>true,'message'=>'Password changed successfully']);
            }
            else
            {
                return response()->json(['status'=>false,'message'=>'Old password is not correct']);
            }
        }
    }



    public function getUserProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
                        'user_id' => 'required'
                        
                    ]);
        if ($validator->fails()) 
        {
            $error = $this->validationHandle($validator->messages()); 
            return response()->json(['status'=>false,'message'=>$error]);
        }
        else
        {
            $row = User::where('id',$request->user_id)
                    
                    ->first();
            if($row)
            {
               $user =  $this->getuserdetailfromObjectArray($row);
                    return response()->json(['status'=>true,'message'=>'User detail','data'=>$user]);
            }
            else
            {
                return response()->json(['status'=>false,'message'=>'Invalid user']);
            }

        }
    }




     public function logout(Request $request)
        {
            $validator = Validator::make($request->all(), [
                            'user_id' => 'required',
                            'device_type'=>'required',
                            'device_id'=>'required'
                        ]);
            if ($validator->fails()) 
            {
                $error = $this->validationHandle($validator->messages()); 
                return response()->json(['status'=>false,'message'=>$error]);
            }
            else
            {
                 $this->manageDeviceIdAndToken($request->user_id,$request->device_id,$request->device_type,'delete');
                return response()->json(['status'=>true,'message'=>'Logout successfully']);

            }
        }



    


}  