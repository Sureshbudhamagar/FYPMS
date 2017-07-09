

@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Submitted Assignments List <span style="float: right">Task: {{ $task->title }}</span></div>

                <div class="panel-body">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>Submitted By</th>
                          <th>Attachment</th>
                          <th>Status</th>
                          <th>Option</th>
                        </tr>
                      </thead>


                      <tbody>
                        @if($submissions)
                          @foreach($submissions as $row)
                        <tr>
                          <td>{{ $row->fname . ' ' . $row->lname }}</td>
                          <td>
                            <a href="{{ $row->attachment }}">Download</a>
                          </td>
                          <td>
                            @if($row->status == 'late')
                            <span style="color: red">{{ $row->status }}</span>
                            @else
                            <span style="color: green">{{ $row->status}}</span>
                            @endif
                          </td>
                          <td>
                            <a href="{{ url('supervisor/submission/detail/' . $row->id) }}" class="btn btn-primary">Detail</a>
                          </td>
                        </tr>
                        @endforeach
                      @else
                      <tr>
                        <td colspan="4">Noone submitted assignments yet!!!</td>
                      </tr>

                      @endif
                      </tbody>

                      <tfoot></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
