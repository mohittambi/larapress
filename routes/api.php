<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Content-Type");
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

 Route::group(['namespace'=>'Api'], function ()
    {
    	Route::post('auth/get-api-key', 'UserController@getApiKey');
    });


//admin Api
  Route::group(['namespace'=>'Api'], function ()
    {
        Route::post('admin/login', 'AdminController@login');
        Route::get('admin/users', 'AdminController@users');
        Route::get('admin/getProfileBySlug/{slug}', 'AdminController@getProfileBySlug');
        Route::post('admin/changeMyPassword', 'AdminController@changeMyPassword');
        Route::post('admin/updateMyProfile', 'AdminController@updateMyProfile');
        Route::get('admin/manageStatus/{slug}', 'AdminController@manageStatus');
        Route::get('admin/dashboard', 'AdminController@dashboard');

    });

 Route::group(['middleware' => 'jwt.auth','namespace'=>'Api'], function ()
    {
        Route::post('sign-up', 'UserController@signup');
        Route::post('login', 'UserController@login');
        Route::post('forgot-password', 'UserController@forgotPassword');
        Route::post('social-user-check', 'UserController@socialUserCheck');
        Route::post('update-profile', 'UserController@updateProfile');
        Route::post('change-password', 'UserController@changePassword');
        Route::post('private-account', 'UserController@privateAccount');
        Route::post('get-user-profile', 'UserController@getUserProfile');
        Route::post('deactive-user-account', 'UserController@deactiveUserAccount');
        Route::post('logout', 'UserController@logout');
    });
