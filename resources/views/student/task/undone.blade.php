@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12 col-md-offset-0">

            <div class="panel panel-default">
                <div class="panel-heading text-uppercase"><h4>{{ $task->title }}
                  <span style="float: right; font-size: 12px">
                    <?php
                      $deadline = date('M d Y | h:i a', strtotime($task->deadline));
                      $time_remaining_array = time_remaining_string($task->deadline);
                      $time_remaining = $time_remaining_array[0];
                      $time_remaining_diff = $time_remaining_array[1];
                      if($time_remaining_diff > 0) {
                        $color = '#0B0';
                      } else {
                        $color = '#D00';
                      }
                    ?>
                    <label>Deadline:</label> {{ $deadline }} |
                    <span style="color: {{ $color }}">{{ $time_remaining }}</span>
                  </span>
                </h4> </div>



                <div class="panel-body">
                 <h1 class="text-danger"> Sorry! Your project is not accepted by Admin. Please contact soon!</h1>
                  <div class="clearfix"></div>                  
                </div>
                <hr>


            </div>

            </div>
    </div>
</div>
@endsection
