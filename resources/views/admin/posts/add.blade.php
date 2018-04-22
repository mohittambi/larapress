@extends('layouts.admin.admin')

@section('content')
   <div class="right_col" role="main">

          <div class="">
           @include('admin.includes.breadcum')
            <div class="row top_tiles">
              <div class="col-md-9">
                {!! Form::open([ 'route' => ['admin.posts.add']] ) !!}
                  <label for="title">Title</label>
                    <input type="text" id="title" name="post_title"/>
                    <br/>
                  <label for="content">Content</label>
                    <textarea id="content" class="form-control" name="post_content" rows="10" cols="50"></textarea>

                    <div class="checkbox">
                      <label><input type="checkbox" name="status" value="publish">Publish</label>
                    </div>

              </div>

              <div class="col-md-3">

                <label for="categories">Categories</label>
                @foreach ($allCategories as $category)

                  <div class="checkbox">
                    <label><input type="checkbox" name="Cats[]" value="{{$category->id}}">{{$category->category_title}}</label>
                  </div>

                @endforeach


                <button  type="submit" class="btn btn-primary">Submit</button>
              {!! Form::close() !!}
              </div>

            </div>
          </div>

          <script src="{{asset('assets/admin/ckeditor/ckeditor.js')}}" ></script>
          <script>
             var post_content = document.getElementById("content");
               CKEDITOR.replace(post_content,{
               language:'en-gb'
             });
             CKEDITOR.config.allowedContent = true;
          </script>

        </div>


@endsection
