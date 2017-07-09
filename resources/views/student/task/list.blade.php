@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12 col-md-offset-0">

          @foreach($projects as $project)
            <div class="panel panel-default">
                <div class="panel-heading"><h4>{{ $project->code }}: {{ $project->title }} <span style="float:right; font-size: 12px">{{ $project->supervisor }}</span></h4> </div>

                @foreach($project->tasks as $task)
                <?php $class = ($task->status = 0)?'label-primary':''; ?>
                <div class="panel-body {{ $class }}">
                  <?php
                  // $created_at = '08/04/2010 22:15:00';
                  $created_at = date('M d Y | h:i a', strtotime($task->created_at));
                  ?>
                  <strong>{{ $task->title }}</strong> <br> {{ $created_at }} | {{ time_elapsed_string($task->created_at) }}

                  <br><br>
                  <p>{{ $task->descr }}</p>

                  Attachments: <a href="{{ $task->attachment}}">Click</a>

                  <br><br>
                  <div class="clearfix"></div>


                  <div class="container">
                    <div class="row">
                      <div class="col-xs-9 col-md-10">
                        <?php
                          $deadline = date('M d Y | h:i a', strtotime($task->deadline));
                          $time_remaining_array = time_remaining_string($task->deadline);
                          $time_remaining = $time_remaining_array[0];
                          $time_remaining_diff = $time_remaining_array[1];
                          if($time_remaining_diff > 0) {
                            $color = '#0B0';
                          } else {
                            $color = '#D00';
                            $time_remaining = (isset($task->submission))?$task->submission->status:'Late';
                          }
                        ?>
                        <label>Deadline (Submit Before):</label> {{ $deadline }} |
                        <span style="color: {{ $color }}">{{ $time_remaining }}</span>
                      </div>
                      <div class="col-xs-3 col-md-2">

                        <a href="{{ url('student/assignment/' . $task->id . '/done') }}" class="btn btn-success">Open</a>
                      </div>
                    </div>
                  </div>
                </div>
                <hr>
                @endforeach

            </div>
          @endforeach

        </div>
    </div>
</div>
@endsection
