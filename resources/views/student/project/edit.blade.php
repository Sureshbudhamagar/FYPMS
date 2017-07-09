@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading"><h3>Edit Project</h3> Please enter prject details</div>

                <div class="panel-body">
                    <form method="post" action="{{ route('project.update' ,$project->id) }}" enctype="multipart/form-data">
                      {{ csrf_field() }}

                      <input type="hidden" name="_method" value="PUT">
                      <div class="form-group">
                        <label for="title">Title</label>

                        <input type="text" name="title" class="form-control" value="{{ $project->title }}" required>
                      </div>

                      <div class="form-group">
                        <label for="abstract">Abstract</label>

                        <textarea name="abstract" rows="4" cols="80" class="form-control"   required>{{$project->abstract }}</textarea>
                      </div>

                      <div class="form-group">
                        <label for="subject_area">Subject Area</label>

                        <input type="text" name="subject_area" class="form-control" value="{{$project->subject_area}}"  required>
                      </div>

                      <div class="form-group">
                        <label for="objectives">Objectives</label>

                        <textarea name="objectives" rows="4" cols="80" class="form-control">{{$project->objectives}} </textarea>
                      </div>

                      <div class="form-group">
                        <label for="deliverables">Deliverables</label>

                        <textarea name="deliverables" rows="4" cols="80" class="form-control" required> {{ $project->deliverables}}</textarea>
                      </div>

                      <div class="form-group">
                        <label for="">Environment</label>

                        <input type="text" name="environment" class="form-control" value="{{$project->environment}}" required>
                      </div>

                     
                      <div class="form-group">
                        <input type="submit" class="btn btn-primary">
                      </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
