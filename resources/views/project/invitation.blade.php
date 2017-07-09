@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12 col-md-offset-0">


            <div class="panel panel-default">
                <div class="panel-heading"><h4>Project Invitations
                <?php  /* <span style="float:right; font-size: 12px">{{ $project->supervisor }}</span> */?>
                </h4> </div>
                @foreach($invitations as $inv)
                <div class="panel-body">
                  <?php
                  // $created_at = '08/04/2010 22:15:00';
                  $created_at = date('M d Y | h:i a', strtotime($inv->created_at));
                  ?>
                  <strong>Project Title: {{ $inv->title.'-'.$inv->id }}</strong> <br> {{ $created_at }} | {{ time_elapsed_string($inv->created_at) }}

                  <br><br>

                  <div class="container">
                    <div class="row">
                      <div class="col-xs-9 col-md-10">
                        {!! $inv->message !!}
                        <div class="clearfix">
                        <a class="btn btn-primary btn-sm" href="{{ url('project/invitation/').'/'.$inv->invitee.'/'.$inv->email.'/'.$inv->id }}">Accept</a>
                        <button class = "btn btn-danger btn-sm" data-toggle = "modal" data-target = "#rejectModal" data-id="{{$inv->id }}">Reject</button>
                        <button class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#holdModal" data-id="{{$inv->id }}">Hold</button>                       
                      </div>
                      </div>
                      <div class="col-md-2">
                        @if($inv->status == 'accepted')
                        <div class="btn btn-success">Accepted</div>
                        @elseif($inv->status == 'pending')
                        <div class="btn btn-info">Pending</div>
                        @elseif($inv->status == 'rejected')
                        <div class="btn btn-danger">Rejected</div>
                        @elseif($inv->status == 'hold')
                        <div class="btn btn-warning">Hold</div>
                        @endif
                      </div>
                    </div>
                  </div>
                </div>
                <hr>
                @endforeach


            </div>

        </div>
    </div>
</div>

@include('project.modal.messageModal')
@endsection
@section('page_specific_scripts')
    @include('project.scripts._scripts')   
@endsection
