<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\User;
use App\Model\Category;
use Session;
use Illuminate\Support\Facades\Validator;
use File;
use DB;



class CategoriesController extends Controller
{
  public function addCategory()
	{
        $title = 'Add Category';
        $allCategories = Category::where('status','publish')->get();

        return view('admin.categories.add',['title' => $title, 'allCategories' => $allCategories]);

	}

  public function storeCategory( Request $request ){

      // Session Flash message
      $title = 'Add Category';
      $user_id =  Session::get('AdminLoggedIn')['user_id'];
      if(!is_null($request->parentCats)){
        $parent_categories = implode(', ', $request->parentCats);
      } else{
        $parent_categories='';
      }

      $category = new Category();
      $category->user_id = $user_id;
      $category->category_title = $request->category_title;
      $category->parent_categories = $parent_categories;
      $category->status = $request->status;
      $category->save();

      $allCategories = Category::where('status','publish')->get();
      return view('admin.categories.add',['title' => $title, 'allCategories' => $allCategories]);

  }

}
