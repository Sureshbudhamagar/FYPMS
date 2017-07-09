@extends('layouts.layout')



@section('content')
        <div class="container">
    <div class="well well-sm">
        <strong>Recent Projects</strong>
        <div class="btn-group">
            <a href="#" id="list" class="btn btn-default btn-sm">
              <span class="glyphicon glyphicon-th-list"></span>
              List
            </a>
            <a href="#" id="grid" class="btn btn-default btn-sm">
              <span class="glyphicon glyphicon-th"></span>
              Grid
            </a>
        </div>

        <div class="btn-group" style="float: right">
            <a href="{{ url('/?list=all') }}" class="btn btn-info btn-sm">
              <!-- <span class="glyphicon glyphicon-th-list"></span> -->
              All
            </a>
            <a href="{{ url('/?list=submitted') }}" class="btn btn-primary btn-sm">
              <!-- <span class="glyphicon glyphicon-th-list"></span> -->
              Submitted
            </a>
            <a href="{{ url('/?list=accepted') }}" class="btn btn-success btn-sm">
              <!-- <span class="glyphicon glyphicon-th"></span> -->
              Accepted
            </a>
            <a href="{{ url('/?list=rejected') }}" class="btn btn-danger btn-sm">
              <!-- <span class="glyphicon glyphicon-th"></span> -->
              Rejected
            </a>
            <a href="{{ url('/?list=onhold') }}" class="btn btn-warning btn-sm">
              <!-- <span class="glyphicon glyphicon-th"></span> -->
              OnHold
            </a>
        </div>
    </div>
    <div id="products" class="row list-group">

      @foreach($projects as $project)
      <?php $class = "" ?>
        @if($project->status == 0)
        <?php $class = "btn-primary" ?>
        @elseif($project->status == 1)
         <?php $class = "btn-success" ?>
        @elseif($project->status == 2)
          <?php $class = "btn-warning" ?>
        @else
          <?php $class = "btn-danger" ?>
        @endif

        <div class="item  col-xs-4 col-lg-4">
            <div class="thumbnail">
                <!-- <img class="group list-group-image" src="http://placehold.it/400x250/000/fff" alt="" /> -->
                <div class="caption  ">
                    <h4 class="group inner list-group-item-heading">
                        {{ $project->title }}</h4>
                    <p class="group inner list-group-item-text">
                        {{ $project->abstract }}</p>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <p class="lead">
                                {{ $project->code }}</p>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <a class="btn {{ $class}} " href="{{ url('project/' . $project->id) }}">Detail</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endforeach


    </div>
</div>
@endsection


@section('mainbanner')
<div class="content">
    <div class="title m-b-md">
        FYPMS
    </div>


</div>
@endsection
