<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\User;
use DB;
use Illuminate\Support\Facades\Input;   
use Session;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use File;
class UserController extends Controller
{

    protected $model;
    protected $title;
    protected $pmodule;
    public function __construct()
    {
        $this->model = 'users';
        $this->title = 'Users';
          $this->pmodule = 'users';
    } 

   

   


    public function login()
    {
        $title= 'Login'; 
        return view('admin.users.login',compact('title'));
    }

    public function makelogin(Request $request)
   {
        
        try {
                $validator = Validator::make($request->all(), [
                            'username' => 'required',
                            'password' => 'required',
                ]);
                if ($validator->fails()) 
                {
                    return redirect()->back()->withInput()->withErrors($validator->errors());
                }
                else 
                {
                   $username = $request->username;
                   $password = bcrypt($request->password);
                   $user = User::where('email',$username)->first();
                  
                    if($user && Hash::check($request->password, $user->password))
                   {
                        Session::put('AdminLoggedIn', ['user_id'=>$user->id,'userData'=> $user]);
                        Session::save();
                        return redirect()->route('admin.dashboard');
                   }
                   else
                   {
                        Session::flash('danger','Invalid username or password');
                        return redirect()->back()->withInput();
                   }
                }
            } 
            catch (\Exception $e) 
            {
                $msg = $e->getMessage();
                Session::flash('danger',$msg);
                return redirect()->back()->withInput();
            }
           
   }

    public function logout()
    {
        Session::forget('AdminLoggedIn');
        return redirect()->route('admin.login');
    }

    public function userGetChangePassword()
    {
        $user_id = Session::get('AdminLoggedIn')['user_id'];
        $row =  User::whereId($user_id)->first();
        $title = 'My-setting';
        $breadcum = ['My-setting'=>''];
       return view('admin.users.change_profile_password',compact('title','breadcum','row')); 
    }

    public function userPostChangePassword(Request $request)
    {
        $rules = array(
            'old_password' => 'required',
            'new_password' => 'required|min:8',
            'confirm_password' => 'required|same:new_password',
        );
        $validator = Validator::make(Input::all(), $rules);
        if ($validator->fails()) 
        {
            return redirect()->back()->withErrors($validator->errors());
        }
        else
        {
            $user_id =  Session::get('AdminLoggedIn')['user_id'];
            $user =  User::whereId($user_id)->first();
            if (Hash::check(Input::get('old_password'), $user->password))
            {
                $user->password = Hash::make(Input::get('new_password'));
                $user->save();
                Session::flash('success', 'Password updated successfully.');
                return redirect()->back();
            } 
            else
            {
                Session::flash('warning', 'Wrong old password');
                return redirect()->back();
            }
        }
    }

     public function myProfile()
    {
        $user_id =  Session::get('AdminLoggedIn')['user_id'];
        $row = User::whereId($user_id)->first();
        $title= 'My-profile'; 
        $breadcum = ['My profile'=>''];
       
        return view('admin.users.myProfile',compact('title','row','breadcum'));

    }

    public function updateMyProfile(Request $request, $slug)
    {
        $row =  User::whereSlug($slug)->first();
        try
        {
            $validator = Validator::make($request->all(), [
                'full_name' => 'required|max:255',
                 'image_update' =>  'mimes:jpeg,jpg,png,gif',
                'email' => 'required|email|unique:users,email,' . $row->id,
                ]);
            if ($validator->fails()) 
            {
                return redirect()->back()->withInput()->withErrors($validator->errors());
            }
            else
            {
                 $previous_row = $row;
                $row->full_name= $request->full_name;
                $row->email=$request->email;
                 if($request->file('image_update'))
                {
                    $file = $request->file('image_update');
                    $image = uploadwithresize($file,'users');
                   
                    if($previous_row->image)
                    {
                        unlinkfile('users',$previous_row->image);
                    }

                    $row->image= $image;
                   
                }
                $row->save();
                Session::flash('success', 'Profile updated successfully.');
                return redirect()->route('admin.profile');
            }  
        }
        catch(\Exception $e)
        {

           $msg = $e->getMessage();
           Session::flash('warning', $msg);
           return redirect()->back()->withInput();
        }
    }

    public function index()
    {
        $title = $this->title;
        $model = $this->model;
       // $lists = User::where('role','U')->get();

       


        $breadcum = [$this->title=>route($this->model.'.index'),'Listing'=>''];
        return view('admin.users.index',compact('title','model','breadcum')); 
    }

    public function userListWithDatatable(Request $request)
    {
        $columns = array( 
                0 =>'id', 
                1 =>'full_name',
                2 =>'email',
                3 =>'created_at',
                4=> 'status',
                5=> 'action',
            );

       

        $totalData = User::where('role','U')->count();
        $totalFiltered = $totalData; 
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if(empty($request->input('search.value')))
        {            
            $posts = User::where('role','U')
                ->offset($start)
                ->limit($limit)
                ->orderBy($order,$dir)
                ->get();
        }
        else
        {
            $search = $request->input('search.value'); 
            $posts = User::where('role','U')
                        ->where(function($query) use ($search){
                        $query->where('id','LIKE',"%{$search}%")
                        
                         ->orWhere('full_name','LIKE',"%{$search}%")
                          ->orWhere('email','LIKE',"%{$search}%");
                        })
                    ->offset($start)
                    ->limit($limit)
                    ->orderBy($order,$dir)
                    ->get();
            $totalFiltered = User::where('role','U')
                                
                               ->where(function($query) use ($search){
                                $query->where('id','LIKE',"%{$search}%")
                               
                                 ->orWhere('full_name','LIKE',"%{$search}%")
                                  ->orWhere('email','LIKE',"%{$search}%");
                                })
                                ->count();
            
        }


         $data = array();
        if(!empty($posts))
        {
            foreach ($posts as $list)
            {
                
                $nestedData['id'] = $list->id;
                $nestedData['created_at'] = date('Y-m-d H:i',strtotime($list->created_at));
               
                $nestedData['status'] = getStatus($list->status,$list->id);
                $nestedData['email'] =  $list->email;
                $nestedData['full_name'] =  $list->full_name;
                $nestedData['action'] =  getButtons([
                                ['key'=>'view','link'=>route('admin.users.view',$list->slug)]
                            ]);
                $data[] = $nestedData;
            }
        }

      $json_data = array(
                "draw"            => intval($request->input('draw')),  
                "recordsTotal"    => intval($totalData),  
                "recordsFiltered" => intval($totalFiltered), 
                "data"            => $data   
                );
        echo json_encode($json_data); 
    }

    public function userStatusUpdate(Request $request)
    {
        $user_id = $request->user_id;
        $row  = User::whereId($user_id)->first();
        $row->status =  $row->status=='1'?'0':'1';
        $row->save();
        $html = '';
        switch ($row->status) {
          case '1':
               $html =  '<a data-toggle="tooltip"  class="btn btn-success btn-xs" title="Active" onClick="changeStatus('.$user_id.')" >Active</a>';
              break;
               case '0':
               $html =  '<a data-toggle="tooltip"  class="btn btn-danger btn-xs" title="Inactive" onClick="changeStatus('.$user_id.')" >Inactive</a>';
              break;
          
          default:
            
              break;
      }
      return $html;


    }


    public function userView($slug)
    {
        $title = $this->title;
        $model = $this->model;
        $row = User::where('slug',$slug)->where('role','U')->first();
        if($row)
        {
            $breadcum = [$this->title=>route($this->model.'.index'),$row->full_name=>''];
            return view('admin.users.userView',compact('title','model','breadcum','row')); 
        }
        else
        {
            Session::flash('warning', 'Invalid request');
           return redirect()->back();
        }   
    }
 
}
