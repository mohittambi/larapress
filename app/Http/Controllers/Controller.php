<?php

namespace App\Http\Controllers;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use DB;
use File;
use App\Model\User;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    function validationHandle($validation)
    {
        foreach ($validation->getMessages() as $field_name => $messages){
            if(!isset($firstError)){
                $firstError = $messages[0];
            }
        }
        return $firstError;
    }

    function randomOtp($length = 30)
    {
        $pool = '0123456789';
        return substr(str_shuffle(str_repeat($pool, $length)), 0, $length);
    }



}
