<?php

namespace App\Http\Controllers\Student;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Models\Project;
use App\Models\StudentProject;
use App\Models\SupervisorProject;
use App\Models\ProjectInvitation;
use App\Models\StudentProjectRel;
use App\Models\SupervisorProjectRel;
use Auth;

class ProjectController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        // dd(Auth::user());
        // \DB::('project')

        \DB::enableQueryLog();


        $user_id = \Auth::user()->id;

        // Project::find();

        // $project = Project::where('active', 1)->first();
        // $project = Project::leftjoin('student_project_rel', 'project.id', '=', 'student_project_rel.project_id')
        //                     ->leftjoin('users', 'student_project_rel.student_id', '=', 'users.id')
        //                     ->select(['*'])
        //                     ->where('users.id', $user_id)
        //                     ->where('users.role', 'student')
        //                     ->get();

        $projects = Project::leftjoin('users', 'users.id', '=', 'project.created_by')
                            ->select(['*', 'project.id as pid'])
                            ->where('users.id', $user_id)
                            ->where('users.role', 'student')
                            ->get();




        // $this->getQueryLog();


        // dd($projects);


        return view('student/project/list', compact('projects'));
    }

    private function getQueryLog()
    {
      echo '<pre>';
      print_r(\DB::getQueryLog());
      echo '</pre>';
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $users = User::where('id','!=',Auth::user()->id)->get();
        return view('student/project/form', compact('projects'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $url = url('/');



        $project = new Project();

        $this->validate($request, [
            'title' =>  'required|unique:project',
            'image' => 'mimes:jpg,jpeg,gif,png|max:2048'
        ]);

        $user = \Auth::user();
        $user_id = \Auth::user()->id;
        $invited_by_email = $user->email;

        $project_code = 'PRJ-' . rand(10000, 99999);


        $project->created_by = $user_id;
        // $project->code = $request->code;
        $project->code = $project_code;
        $project->title = $request->title;
        $project->abstract = $request->abstract;
        $project->subject_area = $request->subject_area;
        $project->objectives = $request->objectives;
        $project->deliverables = $request->deliverables;
        $project->environment = $request->environment;

        if($request->image) {
                  $dir = 'uploads/images';
                  $imagename = time().'.'.$request->image->getClientOriginalExtension();
                  $request->image->move(public_path($dir), $imagename);
                  $project->image = '/' . $dir . '/' . $imagename;
        } else {
          $project->image = '';
        }

        $project->save();

        $project_id = $project->id;

        // dd($request->team_email);



        $team_email = $request->team_email;

        $team_email = array_filter($team_email, 'strlen');

        // send email invitation to team
        foreach($team_email as $temail) {

        $user = User::where('email',$temail)->first();
        $alreadyExist = projectinvitation::where('project_id',$project->id)->where('email',$temail)->first();
        if($alreadyExist)
          continue;

          $projectinvitation = new projectinvitation();
          $projectinvitation->project_id = $project_id;
          $projectinvitation->email = $temail;
          $projectinvitation->invitee = 'student';
          $projectinvitation->status = 'pending';

          $message = 'Hi, <br>you have been invited to join the project as a team member. <br> Please click on the link below to join the project: <br><a href="' . $url . '/project/invitation/student/' . $temail . '/' . $project_id . '">Click here</a>. <br>';

          $projectinvitation->message = $message;

          $projectinvitation->save();

                 /*add student relation*/
          $studentprojectrel = new StudentProjectRel();
          $studentprojectrel->project_id = $project_id;
          $studentprojectrel->student_id = $user->id;
          $studentprojectrel->save();

          //
          $data = array(
            'project_id'    =>  $project_id,
            'invited_by_email'    =>  $invited_by_email,
            'name'          =>  $user->fname . ' ' . $user->lname,
            'subject'       =>  'Team member Project Invitation',
            'message'           =>  $message
          );

          // $toemail = $temail; replace below line with this line.
          $toemail = 'sanjay.khadka@gmail.com';
          \Mail::to($toemail)->send(new \App\Mail\ProjectInvitation($data));
          // \Mail::to($temail)->send(new \App\Mail\ProjectInvitation($data));

        }



        // send invitation to supervisor
        $supervisor_email = $request->supervisor_email;

        $supervisor_email = array_filter($supervisor_email, 'strlen');

        // send email invitation to team
        foreach($supervisor_email as $semail) {

        $user = User::where('email',$semail)->first();
        $alreadyExist = projectinvitation::where('project_id',$project->id)->where('email',$semail)->first();
        if($alreadyExist)
          continue;

          $projectinvitation = new projectinvitation();
          $projectinvitation->project_id = $project_id;
          $projectinvitation->email = $semail;
          $projectinvitation->invitee = 'supervisor';
          $projectinvitation->status = 'pending';

          $message = 'Hi, <br>you have been invited to join the project as a supervisor. <br> Please click on the link below to join the project: <br><a href="' . $url . '/project/invitation/supervisor/' . $semail . '/' . $project_id . '">Click here</a>. ';

          $projectinvitation->message = $message;

          // send email invitation
          $projectinvitation->save();
          /*add supervisor relation*/
          $supervisorprojectrel = new SupervisorProjectRel();
          $supervisorprojectrel->project_id = $project_id;
          $supervisorprojectrel->supervisor_id = $user->id;
          $supervisorprojectrel->save();


          $data = array(
            'project_id'    =>  $project_id,
            'invited_by_email'    =>  $invited_by_email,
            'name'          =>  $user->fname . ' ' . $user->lname,
            'subject'       =>  'Supervisor Project Invitation',
            'message'           =>  $message
          );

          // $toemail = $semail;
          $toemail = 'sanjay.khadka@gmail.com';
          // \Mail::to($toemail)->send(new \App\Mail\ProjectInvitation($data));
        }

        // manage relation in invitation table

        // after accepting invitation, manage relation in studentproject table and user table and remove invitation from intivation table

        $request->session()->flash('alert-success', 'Submitted Successfully!');

        return \Redirect::to('student/project/create');
        // $project
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
       $project = Project::find($id);
      return view('student/project/edit', compact('project'));
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

      $project = Project::find($id);
      $project->update($attributes);

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

        $project = Project::find($id);

        // dd($project);
        if($project) {
          $project_id = $project->id;
          // echo $project_id;

          // $invitation = ProjectInvitation::where('project_id', $project_id)->get();

          // dd($invitation);

          // die;
          $status = $project->delete();


          if($status) {
              \Session::flash('alert-success', 'Deleted Successfully!');

              \DB::table('project_invitation')->where('project_id', $project_id)->delete();

          } else {
            \Session::flash('alert-danger', 'Delete failed!');
          }
        }

        return \Redirect::route('project.index');
    }
}
