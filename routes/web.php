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

		


		
		




		

		
		
});

$this->group(['prefix' => 'admin', 'namespace' => 'Admin','middleware'=>'AdminBeforeLoggedIn'], function () {
		$this->get('/login', 'UserController@login')->name('admin.login');
		$this->post('/login', 'UserController@makelogin')->name('admin.make.login');
});



$this->group([ 'namespace' => 'Front'], function () {
	$this->get('/user-forgot-password', 'UserController@changePassword')->name('front.forgot.password');
	$this->post('/user-forgot-password', 'UserController@updateChangePassword')->name('front.user.post.updated.password');	
	});


