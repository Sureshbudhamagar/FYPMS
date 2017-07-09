@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading"><h3>Create new Task</h3> Please enter task details</div>

                <div class="panel-body">
                    <form method="post" action="{{ route('task.store') }}" enctype="multipart/form-data">
                      {{ csrf_field() }}

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

                        <input type="text" name="title" class="form-control" required>
                      </div>

                      <div class="form-group">
                        <label for="descr">Description</label>

                        <textarea name="descr" rows="4" cols="80" class="form-control" required></textarea>
                      </div>


                      <div class="form-group">
                        <label for="">Attachment</label>

                        <input type="file" name="attachment" class="form-control">
                      </div>

                      <div class="form-group">
                        <label for="">Deadline</label>

                        <input type="date" name="deadline" class="form-control" required>
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
