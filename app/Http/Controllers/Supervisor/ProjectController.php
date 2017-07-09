<?php

namespace App\Http\Controllers\Supervisor;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Project;

class ProjectController extends Controller
{
    //
    public function index()
    {
      // echo $role;
      $user_id = \Auth::user()->id;

      $projects = \DB::table('project')
        ->leftjoin('users', 'users.id', '=', 'project.created_by')
        ->leftjoin('supervisor_project_rel', 'project.id', '=', 'supervisor_project_rel.project_id')
        ->select('project.*', 'users.id as uid', 'users.fname', 'users.lname', 'supervisor_project_rel.supervisor_id')
        ->where('users.role', '=', 'student')
        ->where('supervisor_project_rel.supervisor_id', '=', $user_id)
        ->get();

      // dd($projects);

      return view('supervisor/project/list', compact('projects'));
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

      return view('supervisor/project/detail', compact('project'));
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
