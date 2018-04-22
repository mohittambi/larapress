<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\User;
use App\Model\Post;
use App\Model\Category;
use Session;
use Illuminate\Support\Facades\Validator;
use File;
use DB;



class PostsController extends Controller
{

  public function allPosts()
	{
        $title = 'All Post';

        return view('admin.posts.all',compact('title'));
	}

  public function postListWithDatatable(Request $request)
  {
      $columns = array(
              0 => 'id',
              1 => 'post_title',
              2 => 'excerpt',
              3 => 'created_at',
              4 => 'status',
              5 => 'action',
          );

      $totalData = Post::where('deleted_at',null)->count();
      $totalFiltered = $totalData;
      $limit = $request->input('length');
      $start = $request->input('start');
      $order = $columns[$request->input('order.0.column')];
      $dir = $request->input('order.0.dir');
      if(empty($request->input('search.value')))
      {
          $posts = Post::where('deleted_at',null)
                    ->offset($start)
                    ->limit($limit)
                    ->orderBy($order,$dir)
                    ->get();
      }
      else
      {
          $search = $request->input('search.value');
          $posts = Post::where('deleted_at',null)
                    ->where(function($query) use ($search){
                    $query->where('id','LIKE',"%{$search}%")
                          ->orWhere('post_title','LIKE',"%{$search}%")
                          ->orWhere('post_content','LIKE',"%{$search}%");
                    })
                    ->offset($start)
                    ->limit($limit)
                    ->orderBy($order,$dir)
                    ->get();
          $totalFiltered = Post::where('deleted_at',null)
                            ->where(function($query) use ($search){
                            $query->where('id','LIKE',"%{$search}%")
                                  ->orWhere('post_title','LIKE',"%{$search}%")
                                  ->orWhere('post_content','LIKE',"%{$search}%");
                            })
                            ->count();

      }

      $data = array();



      if(!empty($posts))
      {
          foreach ($posts as $list)
          {
              $excerpt = $list->post_content;
              $excerpt = strip_tags($excerpt);
              if(strlen($excerpt) > 130) {
                $excerpt = substr($excerpt, 0, 130) . '...'; ;
              }
              else {
                $excerpt = $excerpt;
              }

              $nestedData['id'] = $list->id;
              $nestedData['created_at'] = date('d-m-Y H:i A',strtotime($list->created_at));
              $nestedData['status'] = getStatusPost($list->status,$list->id);
              $nestedData['post_title'] =  $list->post_title;
              $nestedData['post_content'] =  $excerpt;
              $nestedData['action'] = getButtons([
                                        ['key'=>'view','link'=>route('admin.posts.view',$list->id)]
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



	public function addPost()
	{
        $title = 'Add Post';
        $allCategories = Category::where('status','publish')->get();

        return view('admin.posts.add',['title' => $title, 'allCategories' => $allCategories]);
	}

  public function storePost( Request $request ){

      // Session Flash message
      $title = 'Add Post';
      $user_id =  Session::get('AdminLoggedIn')['user_id'];
      if(!is_null($request->Cats)){
        $categories = implode(', ', $request->Cats);
      } else{
        $categories='';
      }
      if($request->status==""){
        $status = 'unpublish';
      }
      else {
        $status = $request->status;
      }

      $post = new Post();
      $post->user_id = $user_id;
      $post->post_title = $request->post_title;
      $post->post_content = $request->post_content;
      $post->category_ids = $categories;
      $post->status = $status;
      $post->save();

      $allCategories = Category::where('status','publish')->get();

      return view('admin.posts.add',['title' => $title, 'allCategories' => $allCategories]);

  }

  public function editPost( Request $request, $id ) {

      // $MailBox = MailBox::find($id);
      // $MailBox->value = $request->mailbox_max_messages;
      // $MailBox->save();

  }

  public function editStorepost( Request $request, $id ) {

  }

  public function viewPost( Request $request, $id ) {

  }

}
