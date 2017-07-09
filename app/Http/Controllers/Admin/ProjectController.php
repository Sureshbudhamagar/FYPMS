<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Project;

class ProjectController extends Controller
{
    public function supervisors()
    {
      $users = \App\User::where('role', 'supervisor')->get();

      $role = 'Supervisor';

      return view('admin/users/list', compact('users', 'role'));
    }

    public function students()
    {
      $users = \App\User::where('role', 'student')->get();

      $role = 'Student';

      return view('admin/users/list', compact('users', 'role'));
    }

    //
    public function index()
    {
      // echo $role;

      $projects = \DB::table('project')
        ->leftjoin('users', 'users.id', '=', 'project.created_by')
        ->select('project.*', 'users.id as uid', 'users.fname', 'users.lname')
        ->where('users.role', '=', 'student')
        ->get();

      // dd($projects);

      return view('admin/project/list', compact('projects'));
    }

    public function show($id)
    {
      \DB::enableQueryLog();
      $project = Project::leftjoin('users', 'users.id', '=', 'project.created_by')
                          ->select('project.*', 'users.fname', 'users.lname', 'users.id as uid')
                          ->where('users.role', '=', 'student')
                          ->where('project.id', '=', $id)
                          ->first();

      // dd(\DB::getQueryLog());
      // dd($project);

      // $supervisors =

      return view('admin/project/detail', compact('project'));
    }

    public function status($id, $status)
    {
      // echo $id;
      // echo $status;

      $project = Project::find($id);

      if($project) {
        $project->status = $status;

        $project->save();

        return redirect()->back()->with('success', 'Updated successfully');
      } else {
        abort(404);
      }
    }
}
