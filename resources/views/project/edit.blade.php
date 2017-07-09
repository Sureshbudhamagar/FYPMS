@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading"><h3>Edit Project</h3> Please enter prject details</div>

                <div class="panel-body">
                    <form method="post" action="{{ route('project.store') }}" enctype="multipart/form-data">
                      {{ csrf_field() }}

                      <div class="form-group">
                        <label for="title">Title</label>

                        <input type="text" name="title" class="form-control" required val="{{$project->title">
                      </div>

                      <div class="form-group">
                        <label for="abstract">Abstract</label>

                        <textarea name="abstract" rows="4" cols="80" class="form-control" required></textarea>
                      </div>

                      <div class="form-group">
                        <label for="subject_area">Subject Area</label>

                        <input type="text" name="subject_area" class="form-control" required>
                      </div>

                      <div class="form-group">
                        <label for="objectives">Objectives</label>

                        <textarea name="objectives" rows="4" cols="80" class="form-control"></textarea>
                      </div>

                      <div class="form-group">
                        <label for="deliverables">Deliverables</label>

                        <textarea name="deliverables" rows="4" cols="80" class="form-control" required></textarea>
                      </div>

                      <div class="form-group">
                        <label for="">Environment</label>

                        <input type="text" name="environment" class="form-control" required>
                      </div>

                      <div class="form-group">
                        <label for="">Image</label>

                        <input type="file" name="image" class="form-control">
                      </div>

                      <div class="form-group">
                        <label for="">Team members</label>

                        <!-- <input type="text" name="team" class="form-control"> -->
                        <autocomplete :suggestions="cities" :selection.sync="value"></autocomplete>

                        <label for="">Invite team member by email</label>
                        <br>
                        <input type="text" name="team_email[]" class="form-control">
                        <br>
                        <input type="text" name="team_email[]" class="form-control">
                        <br>
                        <input type="text" name="team_email[]" class="form-control">
                        <br>
                        <input type="text" name="team_email[]" class="form-control">
                        <br>
                        <input type="text" name="team_email[]" class="form-control">
                      </div>

                      <div class="form-group">
                        <label for="">Invite / Assign Supervisor by Email</label>

                        <!-- <input type="text" name="team" class="form-control"> -->
                        <!-- <autocomplete :suggestions="cities" :selection.sync="value"></autocomplete> -->


                        <input type="text" name="supervisor_email[]" class="form-control">
                        <br>
                        <input type="text" name="supervisor_email[]" class="form-control">
                        <br>
                        <input type="text" name="supervisor_email[]" class="form-control">
                      </div>
                      <?php /*
                      <div class="form-group">
                        <div id="app">
                            <h1>Simple typeahead example</h1>
                            <input placeholder="Search US states" @input="input" v-model="typeahead" />
                            <ul v-if="!selected && typeahead">
                              <li v-for="state in states | filterBy typeahead" @click="select(state)">{{ state }}</li>
                            </ul>
                        </div>
                      </div>
                      */ ?>

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
