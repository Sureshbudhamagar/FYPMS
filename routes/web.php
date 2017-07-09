<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function (\Request $request) {

    // echo $request->input('list');
    $list = '';
    if(isset($_GET['list'])) {
      $list = $_GET['list'];
    }

    if($list == 'submitted') {
      $projects = App\Models\Project::where('status', '0')->orderBy('id', 'DESC')->get();
    } else if($list == 'accepted') {
      $projects = App\Models\Project::where('status', '1')->orderBy('id', 'DESC')->get();
    } else if($list == 'rejected') {
      $projects = App\Models\Project::where('status', '2')->orderBy('id', 'DESC')->get();
    } else if($list == 'onhold') {
      $projects = App\Models\Project::where('status', '3')->orderBy('id', 'DESC')->get();
    } else {
      $projects = App\Models\Project::orderBy('id', 'DESC')->get();
    }
    // \DB::enableQueryLog();

    // dd(\DB::getQueryLog());
    // dd($project);
    return view('welcome', compact('projects'));
});

Auth::routes();
Route::get('change-password', function() {return view('user.change-password'); });
Route::post('change-password', 'Auth\UpdatePasswordController@update');

Route::get('/home', 'HomeController@index');



// routes for admin
Route::group(['middleware' => ['web'], 'prefix' => 'admin'], function() {
  Route::get('dashboard', 'Admin\DashboardController@index');
  Route::get('register', 'Admin\DashboardController@register');
  Route::get('student/list', 'Admin\ProjectController@students');
  Route::get('supervisor/list', 'Admin\ProjectController@supervisors');

  Route::get('project/list', 'Admin\ProjectController@index');
  Route::get('project/{id}', 'Admin\ProjectController@show');
  Route::get('project/{id}/status/{status}', 'Admin\ProjectController@status');

  // supervisor add feature
  Route::resource('supervisor', 'Admin\SupervisorController');


  Route::get('message/inbox', 'MessageController@inbox');
});

// routes for supervisor
Route::group(['prefix' => 'supervisor'], function() {
  Route::get('dashboard', 'Supervisor\DashboardController@index');
  Route::get('project/list', 'Supervisor\ProjectController@index');
  Route::get('project/{id}', 'Supervisor\ProjectController@show');

  Route::resource('task', 'Supervisor\TaskController');
  // Route::get('task/submissions', 'Supervisor\ProjectController@submissions');
  Route::get('task/submissions/{task_id}', 'Supervisor\SubmissionController@index');
  Route::get('submission/detail/{id}', 'Supervisor\SubmissionController@detail');
  Route::post('submission/comment/{id}', 'Supervisor\SubmissionController@comment');

  Route::get('project-invitation', 'ProjectInvitationController@invitation');

  Route::get('message/inbox', 'MessageController@inbox');
});

// routes for student
Route::group(['middleware' => ['auth'], 'prefix' => 'student'], function() {
  Route::get('dashboard', 'Student\DashboardController@index');
  // Student Project CRUD
  Route::resource('project', 'Student\ProjectController');

  Route::get('assignment', 'Student\TaskController@assignment');
  Route::get('assignment/{task_id}/done', 'Student\TaskController@done');
  Route::post('submission/{task_id}', 'Student\SubmissionController@submit');
  Route::post('submission/comment/{id}', 'Student\SubmissionController@comment');

  Route::get('project-invitation', 'ProjectInvitationController@invitation');

  Route::get('message/inbox', 'MessageController@inbox');
});

Route::post('message/send', 'MessageController@store');
Route::get('message/mark/{id}', 'MessageController@mark');

// routes for invitation handling
// Route::get('project/invitation/{invitee}/{email}/{project_id}', 'ProjectInvitationController@respondinv');

Route::group(['middleware'=>['web'], 'prefix' =>  'project'], function() {
  // Route::get('/inv/{id}/{e}/{pid}', function() {

  // });
  // Route::get('/inv/{id}/{e}/{pid}', 'ProjectInvitationController@respondinv');
  Route::get('invitation/{invitee}/{email}/{project_id}', 'ProjectInvitationController@respondinvitation');
  Route::post('rejectinvitation', 'ProjectInvitationController@rejectinvitation');
  Route::post('holdinvitation', 'ProjectInvitationController@holdinvitation');

  Route::get('{id}', 'ProjectController@show');
  Route::get('accepted', function() {
    return view('invitation/accepted');
  });
});

Route::resource('tableheader', 'Admin\TableHeaderController');
Route::resource('tabledata', 'Admin\TableDataController');


// project
// Route::get('project/{id}', 'ProjectController@show');

// project list


//
