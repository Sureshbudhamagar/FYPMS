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

                  {!! $task->descr !!}
                  <br><br>
                  <div class="clearfix"></div>


                  <div class="container">
                    <div class="row">

                      <div class="col-xs-10 col-md-11">
                        <form method="post" action="{{ url('student/submission/' . $task->id) }}" enctype="multipart/form-data">
                          {{ csrf_field() }}
                          <div class="form-group">
                            <label>Assignment file:</label>
                            <input type="file" name="attachment" class="form-control" required>
                          </div>

                          <div class="form-group">
                            <input type="submit" class="btn btn-primary">
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
                <hr>


            </div>


            @if(isset($submission->id))
            <div class="panel panel-default">
                <div class="panel-heading"><h4>Comments </span></h4> </div>

                <div class="panel-body">
                  <div class="container-fluid">
                  <div class="col-md-12">
                    <form method="post" action="{{ url('student/submission/comment/' . $submission->id) }}">
                      {{ csrf_field() }}
                      <div class="form-group">
                        <textarea name="comment" class="form-control" placeholder="type your comment.."></textarea>
                      </div>

                      <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Post">
                      </div>

                    </form>

                    <hr>

                    @foreach($comments as $comment)

                      <div class="comment-panel" >

                        <?php
                        $created_at = date('M d Y | h:i a', strtotime($comment->created_at));
                        ?>
                        <h4>{{ $comment->fname }}</h4>  {{ $created_at }} | {{ time_elapsed_string($comment->created_at) }}

                        <br><br>
                        <p>{!! nl2br($comment->comment) !!}</p>
                      </div>
                      <div class="clearfix"></div>
                      <hr>

                    @endforeach


                  </div>
                </div>

                </div>


            </div>
            @endif


        </div>
    </div>
</div>
@endsection
