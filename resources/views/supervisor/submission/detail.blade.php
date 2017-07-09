@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12 col-md-offset-0">


            <div class="panel panel-default">
                <div class="panel-heading"><h4>{{ $submission->title }}  <span style="float:right; font-size: 12px">Deadline: {{ $submission->deadline}} - Status: {{ $submission->status }}</span></h4> </div>

                <div class="panel-body">

                  Attachments: <a href="{{ $submission->attachment}}">Click</a>


                </div>


            </div>

            <div class="panel panel-default">
                <div class="panel-heading"><h4>Comments </span></h4> </div>

                <div class="panel-body">
                  <div class="container-fluid">
                  <div class="col-md-12">
                    <form method="post" action="{{ url('supervisor/submission/comment/' . $submission->id) }}">
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






        </div>
    </div>
</div>
@endsection
