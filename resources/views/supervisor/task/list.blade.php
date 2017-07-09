@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Task List <a href="{{ route('task.create') }}" style="float: right">Create new</a></div>

                <div class="panel-body">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>Title</th>
                          <th>Option</th>
                        </tr>
                      </thead>


                      <tbody>
                        @foreach($tasks as $row)
                        <tr>
                          <td>{{ $row->title }}</td>
                          <td>
                            <a href="{{ route('task.edit', $row->id) }}" class="btn btn-primary">Edit</a>
                            <a href="{{ url('supervisor/task/submissions/' . $row->id) }}" title="submitted tasks by students" class="btn btn-info">Submitted Tasks</a>
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
