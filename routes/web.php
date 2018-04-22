<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    //return view('welcome');
    return redirect()->route('admin.dashboard');
});



$this->group(['prefix' => 'admin', 'namespace' => 'Admin','middleware'=>'AdminLoggedIn'], function () {

		$this->get('/', 'PagesController@dashboard')->name('admin.dashboard');
		$this->get('/dashboard', 'PagesController@dashboard')->name('admin.dashboard');
		$this->get('/logout', 'UserController@logout')->name('admin.logout');
		$this->get('/my-setting', 'UserController@userGetChangePassword')->name('admin.my-settings');
		$this->PATCH('user/change-user-profile-password', 'UserController@userPostChangePassword')->name('users.post.change.profile.password');
		$this->get('/my-profile', "UserController@myProfile")->name('admin.profile');
		$this->PATCH('/my-profile/{slug}', "UserController@updateMyProfile")->name('admin.update.profile');

		$this->resource('settings', 'SettingsController');
		$this->get('/users', 'UserController@index')->name('users.index');
		$this->post('/users/datatables', 'UserController@userListWithDatatable')->name('admin.users.datatables');

		$this->get('/users/{slug}', 'UserController@userView')->name('admin.users.view');
		$this->post('/users/status-update', 'UserController@userStatusUpdate')->name('admin.users.status.update');

// Posts Management

    $this->get('/all-posts', 'PostsController@allPosts')->name('admin.posts.all');
    $this->post('/all-posts/datatables', 'PostsController@postListWithDatatable')->name('admin.posts.datatables');

    $this->get('/add-post', 'PostsController@addPost')->name('admin.posts.add');
    $this->post('/add-post', 'PostsController@storePost')->name('admin.posts.add');

    $this->get('/edit-post', 'PostsController@editPost')->name('admin.posts.edit');
    $this->post('/edit-post', 'PostsController@editStorepost')->name('admin.posts.edit');

    $this->get('/view-post', 'PostsController@viewPost')->name('admin.posts.view');

// Categories Management

  $this->get('/add-category', 'CategoriesController@addCategory')->name('admin.categories.add');
  $this->post('/add-category', 'CategoriesController@storeCategory')->name('admin.categories.add');

});

$this->group(['prefix' => 'admin', 'namespace' => 'Admin','middleware'=>'AdminBeforeLoggedIn'], function () {
		$this->get('/login', 'UserController@login')->name('admin.login');
		$this->post('/login', 'UserController@makelogin')->name('admin.make.login');
});

$this->group([ 'namespace' => 'Front'], function () {
	$this->get('/user-forgot-password', 'UserController@changePassword')->name('front.forgot.password');
	$this->post('/user-forgot-password', 'UserController@updateChangePassword')->name('front.user.post.updated.password');
});
