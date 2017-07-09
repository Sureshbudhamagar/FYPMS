@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                  {{ $role }} List 

                  @if($role == 'Supervisor')
                  <a href="{{ url('admin/supervisor/create') }}" style="float: right">Add Supervisor</a>
                  @endif     

                </div>

                <div class="panel-body">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>Option</th>
                        </tr>
                      </thead>


                      <tbody>
                        @foreach($users as $row)
                        <tr>
                          <td>{{ $row->fname}} {{ $row->lname }}</td>


                          <td>

                            <form method="post" action="{{ url('admin/supervisor/' . $row->id) }}">
                            
                            <!-- <a href="{{ url('admin/supervisor/' . $row->id) }}" class="btn btn-danger">Delete</a> -->

                            <input type="hidden" name="_token" value="{{ csrf_token() }}">

                            <input type="hidden" name="_method" value="DELETE">

                            <input type="submit" value="Delete" class="btn btn-danger">

                            </form>
                          </td>
                        </tr>
                        @endforeach
                      </tbody>

                      <tfoot></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
