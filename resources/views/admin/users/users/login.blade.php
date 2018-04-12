


<!DOCTYPE html>
<html ng-app="app">
<head>
    <meta charset="utf-8" />
    <title>Login</title>
    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/style.css')}}">
     <link rel="stylesheet" href="{{asset('css/font-awesome.min.css')}}">
    

    
    
   
</head>
<body>
   <div class="main-doc">
        <div class="container">
           
               
                <div id="login">
                
    {!! Form::open(['route' => 'admin.make.login','class'=>'validate form-horizontal']) !!}
     {{ csrf_field() }}
      <div class="input-group">
         @include('message')
      </div>
        <div class="input-group">
            <span class="fontawesome-user"></span>
           
             {!! Form::text('username', null, ['class'=>'form-control','id'=>'username','maxlength'=>'255','placeholder'=>'User Name','required'=>true]) !!}
            <div class="form-group">
            </div>
        </div>
        <div class="input-group">
            <span class="fontawesome-lock"></span>
             <input type="password" name="password" id="password" class="form-control"  required  placeholder="Password"/>
            <div class="form-group">
            </div>
        <input type="submit" value="Login"  class="btn btn-primary">
        </div>
    </form>
</div>
        </div>
    </div>
   
<script src="{{asset('assets/admin/bower_components/jquery/dist/jquery.min.js')}}"></script>
<!-- jQuery UI 1.11.4 -->

<script src="{{asset('assets/admin/bower_components/bootstrap/dist/js/bootstrap.min.js')}}"></script>
<script src="{{asset('assets/admin/jquery.validate.min.js')}}"></script>
<script>
 $(".validate").validate();
 </script>
    <style type="text/css">
            

            .error{
            color:red;
            }

            
        </style>
   
</body>
</html>