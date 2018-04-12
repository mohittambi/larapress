
@extends('layouts.admin.admin')

@section('content')


    <!-- Main content -->
    <section class="content">
        <!-- Small boxes (Stat box) -->
                    <div class="box box-primary">
                        <div class="box-header with-border no-padding-h-b">
                            @if(isset($permission[$pmodule.'___add']) || $permission == 'superadmin')
                            <div align = "right"> <a href = "{!! route($model.'.create')!!}" class = "btn btn-success">Add {!! $title !!}</a></div>
                              @endif

                               <div align = "left"> <a href = "javascript:void(0)" class = "btn btn-danger release_all_waiter" onClick="release_all_waiter()">Release All Waiter</a></div>
                            <br>
                            @include('message')
                            <div class="col-md-12 no-padding-h">
                                <table class="table table-bordered table-hover" id="create_datatable">
                                    <thead>
                                    <tr>
                                        <th width="7%">S.No.</th>
                                       
                                        <th width="15%"  >Name</th>
                                        <th width="10%"  >ID No.</th>
                                        <th width="15%"  >Badge No.</th>
                                         <th width="15%"  >Restaurant</th>
                                         <th width="10%" >Role</th>
                                         <th width="10%" >Date Emp.</th>
                                          <th  width="18%" class="noneedtoshort" >Action</th>
                                       
                                        <!--th style = "width:10%" class = "noneedtoshort">Date</th-->
                                        
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @if(isset($lists) && !empty($lists))
                                        <?php $b = 1;?>
                                        @foreach($lists as $list)
                                         
                                            <tr>
                                                <td>{!! $b !!}</td>
                                               
                                                <td>{!! ucfirst($list->name) !!}</td>
                                                 <td>{!! $list->id_number !!}</td>
                                                  <td>{!! $list->badge_number !!}</td>
                                                 <td>{!! ucfirst($list->userRestaurent->name) !!}</td>
                                                    <td>{!! $list->userRole->title !!}</td>
                                                    <td>{!! date('d/m/Y',strtotime($list->date_employeed)) !!}</td>
                                                <td class = "action_crud">




                                                   @if(isset($permission[$pmodule.'___change_password']) || $permission == 'superadmin')
                                                    <span>
                                                    <a title="Change Password" href="{{ route($model.'.change_password', $list->slug) }}" ><i class="fa fa-key"></i>
                                                    </a>
                                                    </span>
                                                    @endif




                                                 @if(isset($permission[$pmodule.'___edit']) || $permission == 'superadmin')
                                                    <span>
                                                    <a title="Edit" href="{{ route($model.'.edit', $list->slug) }}" ><img src="{!! asset('assets/admin/images/edit.png') !!}" alt="">
                                                    </a>
                                                    </span>
                                                    @endif


                                                   
                                                       @if(isset($permission[$pmodule.'___delete']) || $permission == 'superadmin')
                                                    <span>
                                                    <form title="Trash" action="{{ URL::route($model.'.destroy', $list->slug) }}" method="POST">
                                                    <input type="hidden" name="_method" value="DELETE">
                                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                                    <button  style="float:left"><i class="fa fa-trash-o" aria-hidden="true"></i>
                                                    </button>
                                                    </form>
                                                    </span>
                                                    @endif

                                                      @if(isset($permission[$pmodule.'___edit']) || $permission == 'superadmin')

                                                    <span class = "">

                                                    <a title ="Change Status" href="{{ route($model.'.status', [$list->slug,$list->status]) }}" >


                                                    @if($list->status == '1')
                                                    <img src="{!! asset('assets/admin/images/icon-active.png') !!}" alt="">
                                                    @else

                                                    <img src="{!! asset('assets/admin/images/deactivate.png') !!}" alt="">
                                                    @endif


                                                    </a>
                                                    </span>
                                                    @endif


                                                      @if(isset($permission[$pmodule.'___edit']) || $permission == 'superadmin')

                                                    @if($list->userRole->slug=='waiter')
                                                     

                                                    <span>

                                                    


                                                     


                                     <a class="left-padding-small" data-href="{!! route('admin.table.assignment', $list->slug) !!}" onclick="managetableassignment('{!! route('admin.table.assignment', $list->slug) !!}')"  data-toggle="modal" data-target="#assign-table" data-dismiss="modal" ><i class="fa fa-table " style="color: #444; cursor: pointer;" title="Assign Table"></i></a>
                                                     </span>
                                                    @endif
                                                    @endif








                                                </td>
                                                
											
                                            </tr>
                                           <?php $b++; ?>
                                        @endforeach
                                    @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
    </section>


 <div class="modal " id="assign-table" role="dialog" tabindex="-1"  aria-hidden="true" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
    </div>
  </div>
</div>    


<script type="text/javascript">



  function  release_all_waiter()
  {
     var isconfirmed=confirm("Do you want to clear all assigned table?");
    if (isconfirmed)
    {
       window.location.href = '{{route('clear.all.tables.from.waiters')}}';
    } 
  }


  function managetableassignment(link)
{
  $('#assign-table').find(".modal-content").load(link);
}










</script>  
@endsection


