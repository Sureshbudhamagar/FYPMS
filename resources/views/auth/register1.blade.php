@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/register') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('fname') ? ' has-error' : '' }}">
                            <label for="fname" class="col-md-4 control-label">First Name</label>

                            <div class="col-md-6">
                                <input id="fname" type="text" class="form-control" name="fname" value="{{ old('fname') }}" required autofocus>

                                @if ($errors->has('fname'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('fname') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('lname') ? ' has-error' : '' }}">
                            <label for="lname" class="col-md-4 control-label">Last Name</label>

                            <div class="col-md-6">
                                <input id="lname" type="text" class="form-control" name="lname" value="{{ old('lname') }}" required autofocus>

                                @if ($errors->has('lname'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('lname') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <?php
                            $email = '';
                            if(old('email')) {
                              $email = old('email');
                            } else if(isset($_GET['email']) && $_GET['email']) {
                              $email = $_GET['email'];
                            }
                            ?>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ $email }}" required>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="role" class="col-md-4 control-label">Role</label>

                            <div class="col-md-6">
                                <?php
                                $admin_checked = '';
                                if(isset($_GET['role']) && $_GET['role'] == 'admin') {
                                  $admin_checked = 'checked';
                                }

                                $super_checked = '';
                                if(isset($_GET['role']) && $_GET['role'] == 'supervisor') {
                                  $super_checked = 'checked';
                                }

                                $student_checked = 'checked';
                                if(isset($_GET['role']) && $_GET['role'] == 'student') {
                                  $student_checked = 'checked';
                                }

                                if($student_checked || $super_checked) {
                                  $admin_checked = '';
                                }
                                ?>

                                <?php if($admin_checked) { ?>
                                <input id="role" type="radio" class="form-control" name="role" value="admin" {{ $admin_checked }} required> Admin
                                <?php } ?>

                                <?php if($super_checked) { ?>
                                <input id="role" type="radio" class="form-control" name="role" value="supervisor" {{ $super_checked }} required> Supervisor
                                <?php } ?>

                                <?php if($student_checked) { ?>
                                <input id="role" type="radio" class="form-control" name="role" value="student" {{ $student_checked }} required> Student
                                <?php } ?>
                            </div>


                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
