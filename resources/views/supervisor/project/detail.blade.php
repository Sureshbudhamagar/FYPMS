@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Project Detail: </div>

                <div class="panel-body">
                  <table class="table table-striped">
                    <tbody>
                      <tr>
                        <th>Title: </th><td>{{ $project->title }}</td>
                      </tr>

                      <tr>
                        <th>Project Code: </th><td>{{ $project->code }}</td>
                      </tr>

                      <tr>
                        <th>Created By: </th><td>{{ $project->fname }} {{ $project->lname }}</td>
                      </tr>

                      <tr>
                        <th>Abstract: </th><td>{{ $project->abstract }} </td>
                      </tr>

                      <tr>
                        <th>Subject Area: </th><td>{{ $project->subject_area }}</td>
                      </tr>

                      <tr>
                        <th>Objectives: </th><td>{{ $project->objectives }}</td>
                      </tr>



                      <tr>
                        <th>Deliverables: </th><td>{{ $project->deliverables }}</td>
                      </tr>

                      <tr>
                        <th>Environment: </th><td>{{ $project->environment }}</td>
                      </tr>

                      <tr>
                        <th>Image: </th><td><img src="{{ $project->image }}"></td>
                      </tr>


                      <tr>
                        <th>Team Members:</th>
                        <td></td>
                      </tr>

                      <tr>
                        <th>Supervisor:</th>
                        <td></td>
                      </tr>

                      <tr>
                        <th>Status:</th>
                        <td>
                          @if($project->status == 1)
                          <span class="label label-success">Accepted</span>
                          @elseif($project->status == 3)
                          <span class="label label-danger">Rejected</span>
                          @elseif($project->status == 2)
                          <span class="label label-warning">On Hold</span>
                          @else
                          <span class="label label-primary">Submitted</span>
                          @endif
                        </td>
                      </tr>

                      <tr>
                        <th colspan="2">&nbsp;</th>
                      </tr>

                      <!--
                      <tr>
                        <th colspan="2" style="text-align: center">
                          <?php /* @if($project->status == 0 || $project->status == 2) */ ?>
                          <a href="{{ url('admin/project/' . $project->id . '/status/1') }}" class="btn btn-success">Accept</a>
                          <a href="{{ url('admin/project/' . $project->id . '/status/3') }}" class="btn btn-danger">Reject</a>
                          <a href="{{ url('admin/project/' . $project->id . '/status/2') }}" class="btn btn-warning">On Hold</a>
                          <?php /* @endif */ ?>
                        </th>
                      </tr>
                    -->

                    </tbody>

                  </table>








                </div>
            </div>
        </div>
    </div>
</div>
@endsection
