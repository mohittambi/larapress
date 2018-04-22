@extends('layouts.admin.admin')

@section('content')
   <div class="right_col" role="main">

          <div class="">
           @include('admin.includes.breadcum')
            <div class="row top_tiles">
              <div class="col-md-9">
                {!! Form::open([ 'route' => ['admin.categories.add']] ) !!}
                  <label for="title">Category Name</label>

                    <input type="text" id="title" name="category_title"/>
                    <input type="hidden" id="status" name="status" value="publish"/>
              </div>

              <div class="col-md-3">

                <label for="categories">Parent Category</label>
                @foreach ($allCategories as $category)

                  <div class="checkbox">
                    <label><input type="checkbox" name="parentCats[]" value="{{$category->id}}">{{$category->category_title}}</label>
                  </div>

              @endforeach

                <button  type="submit" class="btn btn-primary">Submit</button>
              {!! Form::close() !!}
              </div>

            </div>
          </div>

        </div>


@endsection
