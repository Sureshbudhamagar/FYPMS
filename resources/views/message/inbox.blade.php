@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12 col-md-offset-0">        
            <div class="panel panel-default">
                         <div class="panel-heading"><h4>Messages </span></h4> </div>

                <div class="panel-body">
                  <div class="container-fluid">
                  <form method="post" action="{{ url('message/send') }}">
                      {{ csrf_field() }}
                      <div class="form-group">
                        <select name="to" class="form-control">
                          @foreach($receipients as $receipient)
                          <option value="{{ $receipient->id }}">{{ $receipient->fname . ' ' . $receipient->lname }}</option>
                          @endforeach
                        </select>
                      </div>

                      <div class="form-group">
                        <textarea name="message" class="form-control" placeholder="type your message.." style="height: 100px" required></textarea>
                      </div>

                      <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Post">
                      </div>

                    </form>
            <ul id = "myTab" class = "nav nav-tabs">
   <li class = "active">
      <a href="#inbox" data-toggle = "tab">
         Inbox  <span class="badge"></span>
      </a>
   </li>
   
   <li><a href="#sent" data-toggle = "tab">Sent  </a></li>   
  
</ul>

<div id = "messageTabContent" class = "tab-content">

   <div class = "tab-pane fade in active" id = "inbox">
    <div class="row">
       <div class="col-md-12">
                    
                  <p class="pull-right">Total :{{ count($tomessages) }}</p>
                    <hr>

                    @foreach($tomessages as $message)

                      <div class="comment-panel" >

                        <?php
                        $created_at = date('M d Y | h:i a', strtotime($message->created_at));
                        ?>
                        <strong>From: {{ $message->fromfname }} {{ $message->fromlname }}</strong>
                       <!--  <br>
                        <strong>To: {{ $message->tofname }} {{ $message->tolname }}</strong>
                         -->
                        <br>
                        {{ $created_at }} | {{ time_elapsed_string($message->created_at) }}

                        <span style="float: right">
                          @if($message->status == 0)
                          <span class="btn btn-primary btn-xs">Unread</span>
                          
                          <a href="{{ url('message/mark/' . $message->id) }}" class="btn btn-default btn-xs">Mark as Read</a>
                          @else
                          <span class="btn btn-success btn-xs">Read</span>
                          <a href="{{ url('message/mark/' . $message->id) }}" class="btn btn-default btn-xs">Mark as Unread</a>
                          @endif

                        </span>

                        <br><br>
                        <p>{!! nl2br($message->message) !!}</p>
                      </div>
                      <div class="clearfix"></div>
                      <hr>

                    @endforeach


                  </div>
    </div>
   </div>
   
   <div class = "tab-pane fade" id = "sent">
     <div class="row">
       <div class="col-md-12">
                    
  
                  <p class="pull-right">Total :{{ count($frommessages) }}</p>
                   
                    <hr>

                    @foreach($frommessages as $message)

                      <div class="comment-panel" >

                        <?php
                        $created_at = date('M d Y | h:i a', strtotime($message->created_at));
                        ?>
                       <!--  <strong>From: {{ $message->fromfname }} {{ $message->fromlname }}</strong>
                        <br> -->
                        <strong>To: {{ $message->tofname }} {{ $message->tolname }}</strong>
                        <br>
                        {{ $created_at }} | {{ time_elapsed_string($message->created_at) }}

                        <span style="float: right">
                          @if($message->status == 0)
                          <span class="btn btn-primary btn-xs">Unread</span>
                          @else
                          <span class="btn btn-success btn-xs">Read</span>
                          @endif

                        </span>

                        <br><br>
                        <p>{!! nl2br($message->message) !!}</p>
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






        </div>
    </div>
</div>
@endsection
