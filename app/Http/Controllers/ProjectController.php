<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Project;

class ProjectController extends Controller
{
    //


    

    public function show($id)
    {

      $project = Project::find($id);
      return view('project/detail', compact('project'));
    }    

    public function edit($id)
    {

      $project = Project::find($id);
      return view('project/edit', compact('project'));
    }
}
