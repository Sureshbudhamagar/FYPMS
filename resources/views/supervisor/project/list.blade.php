@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Project List</div>

                <div class="panel-body">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>Code</th>
                          <th>Title</th>
                          <th>Created By</th>
                          <!-- <th>Supervisor</th> -->
                          <th>Status</th>
                          <th>Option</th>
                        </tr>
                      </thead>


                      <tbody>
                        @foreach($projects as $project)
                        <tr>
                          <td>{{ $project->code }}</td>
                          <td>{{ $project->title }}</td>
                          <td>{{ $project->fname}} {{ $project->lname }}</td>
                          <!-- <td></td> -->
                          <td>
                            @if($project->status == 0)
                              Submitted
                            @elseif($project->status == 1)
                              Accepted
                            @elseif($project->status == 2)
                              Onhold
                            @else
                              Rejected
                            @endif

                          </td>
                          <td><a href="{{ url('supervisor/project/' . $project->id) }}">Detail</a></td>
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
