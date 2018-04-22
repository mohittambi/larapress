<?php
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Input;
use App\Model\User as User;
use App\Model\Setting;


if (! function_exists('mailSend')) {
 function mailSend($data)
    {
        try {
            Mail::send('emails.forgot_password', ['data' => $data], function($message) use ($data)
            {
                $message->from('oliver7415@googlemail.com', 'Passing Buy');
                $message->to( $data['email'] )->subject("Forgot Password" );

            });
            return true;
        } catch (Exception $ex) {
            dd($ex);
            return false;
        }
    }
}

if (! function_exists('getSettings')) {
 function getSettings()
    {
        return Setting::select('description','name')->pluck('description','name')->toArray();
    }
}

if (! function_exists('getLoggedUserInfo')) {
 function getLoggedUserInfo()
    {
        $user = \Session::get('AdminLoggedIn');

        return User::select('full_name','image','id')->where('id',$user['user_id'])->first();
    }
}

/*
** File Upload with intervation
*/
if ( ! function_exists('uploadwithresize'))
{
    function uploadwithresize($file,$path)
    {
        $h=200;
        $w= 200;
        $fileName = time().rand(111111111,9999999999).'.'.$file->getClientOriginalExtension();
        $destinationPath    = 'public/uploads/'.$path.'/';
        // upload new image
        Image::make($file->getRealPath())
        // original
        ->save($destinationPath.$fileName)
        // thumbnail
        ->resize($w, $h)
        ->save($destinationPath.'thumb/'.$fileName)
        ->destroy();
        return $fileName;
    }
}

/*
** File Upload
*/
if ( ! function_exists('upload'))
{
    function upload($fileName,$path)
    {
            $file = $fileName;
            $destinationPath = 'public/uploads/'.$path;
            $extension = $file->getClientOriginalExtension();
            $fileName = rand(11111,99999).'.'.$extension;
            $file->move($destinationPath, $fileName);
            return $fileName;
    }
}

// remove file from folder
if ( ! function_exists('unlinkfile'))
{
    function unlinkfile($path,$file_name)
    {
        $file1    = 'public/uploads/'.$path.'/'.$file_name;
        $file2    = 'public/uploads/'.$path.'/thumb/'.$file_name;
       File::delete($file1, $file2);
    }
}

/*
 * * Button With Html
 */
if (!function_exists('buttonHtml')) {

    function buttonHtml($key, $link) {
        $array = [
            "edit" => "<span class='f-left margin-r-5'><a data-toggle='tooltip'  class='btn btn-primary btn-xs' title='Edit' href='" . $link . "'><i class='fa fa-pencil-square-o' aria-hidden='true'></i></a></span>",
            "Active" => '<span class="f-left margin-r-5"> <a data-toggle="tooltip" class="btn btn-success btn-xs" title="Active" href="' . $link . '"><i class="fa fa-check" aria-hidden="true"></i></a></span>',
            "Inactive" => '<span class="f-left margin-r-5"> <a data-toggle="tooltip" class="btn btn-warning btn-xs" title="Inactive" href="' . $link . '"><i class="fa fa-times" aria-hidden="true"></i></a></span>',

            "delete" => '<form method="POST" action="' . $link . '" accept-charset="UTF-8" style="display:inline"><input name="_method" value="DELETE" type="hidden">
' . csrf_field() . '<span><button data-toggle="tooltip" title="Delete" type="submit" class="btn btn-danger btn-xs"><i class="fa fa-trash-o" aria-hidden="true"></i></button></span></form>',
            "view" => '<span class="f-left margin-r-5"><a data-toggle="tooltip"  class="btn btn-info btn-xs" title="View" href="' . $link . '"><i class="fa fa-eye" aria-hidden="true"></i></a></span>'
        ];

        if (isset($array[$key])) {
            return $array[$key];
        }
        return '';
    }

}

/*
 * * Button With Html
 */
if (!function_exists('getButtons')) {

    function getButtons($array = []) {
        $html = '';
        foreach($array as $arr)
        {
            $html  .= buttonHtml($arr['key'],$arr['link']);
        }
        return $html;

    }

}

/*
 * * Button With Html
 */
if (!function_exists('getStatus')) {

    function getStatus($current_status,$id) {
      $html = '';
      switch ($current_status) {
              case '1':
                $html =  '<span class="f-left margin-r-5" id = "status_'.$id.'"><a data-toggle="tooltip"  class="btn btn-success btn-xs" title="Active" onClick="changeStatus('.$id.')" >Active</a></span>';
              break;

              case '0':
                $html =  '<span class="f-left margin-r-5" id = "status_'.$id.'"><a data-toggle="tooltip"  class="btn btn-danger btn-xs" title="Inactive" onClick="changeStatus('.$id.')" >Inactive</a></span>';
              break;

              default:

              break;

      }

      return $html;

    }

}

if (!function_exists('getStatusPost')) {

    function getStatusPost($current_status,$id) {
      $html = '';
      switch ($current_status) {
              case 'publish':
                $html =  '<span class="f-left margin-r-5" id = "status_'.$id.'"><a data-toggle="tooltip"  class="btn btn-success btn-xs" title="Published" onClick="changeStatus('.$id.')" >Published</a></span>';
              break;

              case 'unpublish':
                $html =  '<span class="f-left margin-r-5" id = "status_'.$id.'"><a data-toggle="tooltip"  class="btn btn-danger btn-xs" title="UnPublished" onClick="changeStatus('.$id.')" >UnPublished</a></span>';
              break;

              default:
              $html="Bingo!";
              break;

      }

      return $html;

    }

}
