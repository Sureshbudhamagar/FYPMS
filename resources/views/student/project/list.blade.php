@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading"><h3>View my projects</div>

                <div class="panel-body">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>SN.</th>
                        <th>Created On</th>
                        <th>Id</th>
                        <th>Code</th>
                        <th>Title</th>
                        <th>Status</th>
                        <th style="width: 20%">Options</th>
                      </tr>
                    </thead>

                    <tbody>
                      <?php $sn = 1; ?>

                      @if(count($projects) > 0)
                      @foreach($projects as $project)
                      <tr>
                        <td>{{ $sn++ }}</td>
                        <td>{{ date('F j, Y, g:i a', strtotime($project->created_at)) }}</td>
                        <td>{{ $project->pid }}</td>
                        <td>{{ $project->code }}</td>
                        <td>{{ $project->title }}</td>
                        <td> @if($project->status == 0)
                              Submitted
                            @elseif($project->status == 1)
                              Accepted
                            @elseif($project->status == 2)
                              Onhold
                            @else
                              Rejected
                            @endif</td>
                        <td>
                          <a href="{{ route('project.edit', $project->pid) }}" class="btn btn-success btn-xs" style="float: left">Edit</a>
                          <?php /*
                          <a href="{{ route('project.destroy', $project->id) }}" class="btn btn-danger">Delete</a>
                          */ ?>

                          <?php /*
                          @include('utils.delete', array( 'url' => URL::route('project.destroy', $project->pid), 'text' => '<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Delete'))
                          */ ?>

                          @include('utils.delete', array( 'url' => URL::route('project.destroy', $project->pid), 'text' => 'Delete'))


                        </td>
                      </tr>
                      @endforeach
                      @else
                      <tr style="color: red; text-align: center">
                        <td colspan="7">No records found</td>
                      </tr>
                      @endif
                    </tbody>

                    <tfoot>
                      <tr>
                        <th>SN.</th>
                        <th>Created On</th>
                        <th>Id</th>
                        <th>Code</th>
                        <th>Title</th>
                        <th>Status</th>
                        <th style="width: 20%">Options</th>
                      </tr>
                    </tfoot>
                  </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
