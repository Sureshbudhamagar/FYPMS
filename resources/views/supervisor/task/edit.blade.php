@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading"><h3>Edit Project</h3> Please enter prject details</div>

                <div class="panel-body">
                    <form method="post" action="{{ route('task.update' ,$task->id) }}" enctype="multipart/form-data">
                      {{ csrf_field() }}

                      <input type="hidden" name="_method" value="PUT">
                      <div class="form-group">
                        <label for="title">Assign task to project</label>

                        <select class="form-control" name="project_id" required>
                          @foreach($projects as $project)
                            <option value="{{ $project->id }}">{{ $project->title }}</option>
                          @endforeach
                        </select>
                      </div>

                      <div class="form-group">
                        <label for="title">Title</label>

                        <input type="text" name="title" class="form-control" value="{{ $task->title }}" required>
                      </div>

                      <div class="form-group">
                        <label for="descr">Description</label>

                        <textarea name="descr" rows="4" cols="80" class="form-control" required>{{ $task->descr }} </textarea>
                      </div>


                      <div class="form-group">
                        <label for="">Attachment</label>

                        <input type="file" name="attachment" class="form-control" >
                      </div>

                      <div class="form-group">
                        <label for="">Deadline</label>

                        <input type="date" name="deadline" class="form-control" value="{{ $task->deadline }}"  required>
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
