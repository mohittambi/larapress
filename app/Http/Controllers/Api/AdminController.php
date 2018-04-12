<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\User;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use DB;
use Illuminate\Pagination\Paginator;

class AdminController extends Controller
{   
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
                        'username' => 'required',
                        'password' => 'required',
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
            $row = User::where('role','A')
                    ->where('status','1')
                    ->where(function($query) use ($user_name){
                          $query  ->where('email', $user_name);
                        $query->orWhere('username', $user_name);
                    })
                    ->first();

            if ($row && Hash::check($request->password, $row->password)) 
            {
                $user =  $this->getuserdetailfromObjectArray($row);      
                return response()->json(['status'=>true,'message'=>'login successfully','data'=>$user]);
            }
            else
            {
                return response()->json(['status'=>false,'message'=>'Invalid username or password']);
            }
        }
    }

    public function getProfileBySlug($slug)
    {
        $row = User::where('slug',$slug)->first();
       if($row)
       {
            $user =  $this->getuserdetailfromObjectArray($row);      
            return response()->json(['status'=>true,'message'=>'Profile detail','data'=>$user]);
       }
       else
       {
            return response()->json(['status'=>false,'message'=>'No record found']);
       }
        
    }

    public function manageStatus($slug)
    {
         $row = User::where('slug',$slug)->first();
        if($row)
        {
            $row->status = $row->status==1?0:1;
            $row->save();
            $user =  $this->getuserdetailfromObjectArray($row);      
            return response()->json(['status'=>true,'message'=>'User detail','data'=>$user]);
        }
        else
        {
             return response()->json(['status'=>false,'message'=>'No record found']);
        }
        
    }


    public function changeMyPassword(Request $request)
    {
       $validator = Validator::make($request->all(), [
                        'current_password' => 'required',
                        'new_password' => 'required',
                        'slug' => 'required',
                        'confirm_password' => 'required|same:new_password',
                    ]);
        if ($validator->fails()) 
        {
            $error = $this->validationHandle($validator->messages()); 
            return response()->json(['status'=>false,'message'=>$error]);
        }
        else
        {
            $row = User::whereSlug($request->slug)->first();
            if (Hash::check($request->current_password, $row->password)) 
            {
                $row->password = bcrypt($request->new_password);
                $row->save();
                return response()->json(['status'=>true,'message'=>'Password changed successfully']);

            }
            else
            {
                 return response()->json(['status'=>false,'message'=>'Old password is not correct']);
            }
            
        }
    }

    public function updateMyProfile(Request $request)
    {
       $validator = Validator::make($request->all(), [
                        'user_id' => 'required',
                        'slug' => 'required',
                        'full_name'=>'required',
                        'username' => 'required||max:255|unique:users,username,' . $request->user_id,
                        'email' => 'required||max:255|email|unique:users,email,' . $request->user_id,
                       
                       
                    ]);
        if ($validator->fails()) 
        {
            $error = $this->validationHandle($validator->messages()); 
            return response()->json(['status'=>false,'message'=>$error]);
        }
        else
        {
            $row = User::whereId($request->user_id)->first();
            if ($row) 
            {
                $row->full_name = $request->full_name;
                $row->username = $request->username;
                $row->email = $request->email;
                $row->save();
                return response()->json(['status'=>true,'message'=>'Profile updated successfully','data'=>$this->getuserdetailfromObjectArray($row)]);

            }
            else
            {
                 return response()->json(['status'=>false,'message'=>'Invalid user detail']);
            }
            
        }
    }

    

    public function users(Request $request)
    {
        $limit = 10;
        $currentPage = 1;
        if ($request->has('page'))
        {
           $currentPage = $request->input('page');
        }
        Paginator::currentPageResolver(function () use ($currentPage) {
            return $currentPage;
        });
        $row = User::where('role','U')->orderBy('id','desc')->paginate($limit);
        $i= 0;
        $users = [];
        
        foreach($row as $data)
        {
            $users[$i]['full_name'] = ucfirst($data->full_name);
            $users[$i]['username'] = $data->username;
            $users[$i]['userslug'] = $data->slug;
            $users[$i]['email'] = $data->email;
            $users[$i]['is_private'] = $data->is_private;
            $users[$i]['status'] = $data->status;
            $users[$i]['created_at'] = date('Y-m-d H:i',strtotime($data->created_at));
            $users[$i]['user_id'] = $data->id;
            $i++;
        }
        $pagination_info = $this->getPaginationInfo($row);
        return response()->json(['status'=>true,'message'=>'users list','data'=>$users,'pagination_info'=>$pagination_info]);
    }

    public function getuserdetailfromObjectArray($row)
    {
        $user = (object)array(
                    'user_id'=>$row->id,
                    'full_name'=>ucfirst($row->full_name),
                    'username'=>$row->username,
                    'email'=>$row->email,
                    'slug'=>$row->slug,
                    'status'=>$row->status,
                    'is_private'=>$row->is_private,
                    'created_at'=> date('Y-m-d H:i',strtotime($row->created_at))
                );
        return $user;
    }

    public function dashboard()
    {
        $dashboard = [
                        'user_count'=>User::where('role','U')->count()

                    ];
         return response()->json(['status'=>true,'message'=>'Dashboard','data'=>$dashboard]);
    }

    public function getPaginationInfo($row)
    {
        if ($row->lastPage() <= 5) 
        {
        $startPage = 1;
        $endPage = $row->lastPage();
        } 
        else 
        {
            if ($row->currentPage() <= 3) 
            {
                $startPage = 1;
                $endPage = 5;
            } 
            else if ($row->currentPage() + 1 >= $row->lastPage()) 
            {
                $startPage = $row->lastPage() - 4;
                $endPage = $row->lastPage();
            }
             else 
             {
                $startPage = $row->currentPage() - 2;
                $endPage = $row->currentPage()+2;
            }
        }
       return  ['currentPage'=>$row->currentPage(),'lastPage'=>$row->lastPage(),'totalRecord'=>$row->total(),'totalPages'=>$row->lastPage(),'pages'=>range($startPage, $endPage)];
    }

   


}  