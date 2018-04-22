<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\User;
use App\Model\UserDevice;
use App\Model\SocialAccount;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use DB;

class AdminController extends Controller
{
  public function dashboard() {
    dd('in dash api');
  }

}
