<?php

namespace App\Http\Controllers\Supervisor;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Project;
use App\Models\Task;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $supervisor_id = \Auth::user()->id;
      
      $tasks = Task::all()->sortByDesc('id')->where('supervisor_id', $supervisor_id)->where('supervisor_id', $supervisor_id);

      return view('supervisor/task/list', compact('tasks'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $supervisor_id = \Auth::user()->id;

        $projects = \App\Models\Project::leftjoin('supervisor_project_rel as spr', 'spr.project_id', '=', 'project.id')
                  ->leftjoin('project_invitation as pi', 'pi.project_id', '=', 'project.id')
                  ->where('pi.status', '=', 'accepted')
                  ->where('spr.supervisor_id', '=', $supervisor_id)
                  ->select('project.title', 'project.id')
                  ->get();

        // dd($projects);

        return view('supervisor/task/form', compact('projects'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $task = new Task();

        $task->supervisor_id = \Auth::user()->id;
        $task->title = $request->title;
        $task->descr = $request->descr;
        $task->project_id = $request->project_id;
        $task->status = 0;

        $this->validate($request, [
              'title' =>  'required',
              'deadline'  =>  'required',
              'attachment' => 'mimes:doc,docx,pdf,jpg,jpeg,gif,png|max:2048'
        ]);

        // convert mm/dd/yy provided by html5 date to YY-mm-dd
        // It's important to note the different interpretation of - and / in the date. If you use a - php will determine it to be DD-MM, if you use a / php will determine it to be MM-DD.
        $deadline = $request->deadline;
        $task->deadline = date("Y-m-d", strtotime($deadline));

        // $file = '';
        $attachment = '';
        if($request->attachment) {
                        // save to public path
                        $dir = 'files/attachment';
                        $file = time().'.'.$request->attachment->getClientOriginalExtension();
                        // $request->image->move(public_path($dir), $file);
                        $filefullpath = $request->file('attachment')->move(public_path($dir), $file);
                        $attachment = '/' . $dir . '/' . $file;


                        // save to storage path
                        // $file = $request->file('attachment')->store('task');


        }

        // $task->attachment = $file;
        $task->attachment = $attachment;

        // echo storage_path('app/task');
        // echo \Storage::url('task');
        // die;
        // echo $file;

        $status = $task->save();

        if($status) {
          $request->session()->flash('alert-success', 'Assigned Successfully!');
        } else {
          $request->session()->flash('alert-error', 'Error Saving!');
        }

        return redirect()->back();

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
         $projects = Project::all();
         $task = Task::find($id);
      return view('supervisor/task/edit', compact('task','projects'));
    
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
         $attributes = $request->all();

      $task = Task::find($id);
      $task->update($attributes);

      $request->session()->flash('alert-success', 'Updated Successfully!');

        return \Redirect::back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
