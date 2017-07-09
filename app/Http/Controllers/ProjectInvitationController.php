<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\Message;
use App\Models\ProjectInvitation;
use App\Models\StudentProjectRel;
use App\Models\SupervisorProjectRel;
use Illuminate\Http\Request;

class ProjectInvitationController extends Controller
{
    public function invitation()
    {
        \Auth::user()->id;
        $email       = \Auth::user()->email;
        $invitations = ProjectInvitation::leftjoin(
            'project',
            'project.id',
            '=',
            'project_invitation.project_id'
        )
            ->select('project_invitation.*', 'project.title')
            ->where('email', $email)->orderBy('id', 'desc')
            ->get();

        // dd($invitations);

        return view('project/invitation', compact('invitations'));
    }
    //
    // public function supervisor()
    // {
    //
    // }
    //
    // public function student()
    // {
    //
    // }

    public function invi($i, $e, $pid)
    {

    }

    public function respondinvitation($invitee, $email, $project_id)
    {
        // die();
        // $invitation = ProjectInvitation::leftjoin('project', 'project.id', '=', 'project_invitation.project_id')
        //               ->select('project_invitation.*', 'project.created_by')
        //               ->where('project_invitation.project_id', $project_id)
        //               ->where('project_invitation.email', $email)
        //               ->where('project_invitation.invitee', $invitee)
        //               ->first();

        $invitation = ProjectInvitation::where('id', $project_id)
            ->where('email', $email)
            ->where('invitee', $invitee)
            ->where('status', 'pending')
            ->first();

        // dd($invitation);

        if ($invitation) {

            if ($invitee === 'supervisor') {
                // $student_id = $invitation->
                \DB::enableQueryLog();
                $user = \App\User::where('email', $email)
                    ->where('role', 'supervisor')
                    ->first();

                echo '<pre>';
                print_r(\DB::getQueryLog());
                echo '</pre>';
                // dd($user);

                // check if this student is already registered, if yes, add this student to project relation table
                if ($user) {
                    // insert this invited student into student_project_rel table
                    $supervisorprojectrel                = new SupervisorProjectRel();
                    $supervisorprojectrel->supervisor_id = $user->id;
                    $supervisorprojectrel->project_id    = $project_id;

                    $supervisorprojectrel->save();

                    // update invitation pending status to accepted
                    $invitation->status = 'accepted';

                    $invitation->save();

                    return redirect()->back()->with('success', 'Accepted successfully');
                }
                // if not registered already, redirect him/her to register form
                else {
                    // set supervisor email to session
                    // redirect to register form
                    // \Session::set();
                    return redirect()->to('register?email=' . $email . '&role=supervisor');
                }
            }

            if ($invitee === 'student') {
                // $student_id = $invitation->
                \DB::enableQueryLog();
                $user = \App\User::where('email', $email)
                    ->where('role', 'student')
                    ->first();
                echo '<pre>';
                print_r(\DB::getQueryLog());
                echo '</pre>';
                // dd($user);

                // check if this student is already registered, if yes, add this student to project relation table
                if ($user) {
                    // insert this invited student into student_project_rel table
                    $studentprojectrel             = new StudentProjectRel();
                    $studentprojectrel->student_id = $user->id;
                    $studentprojectrel->project_id = $project_id;

                    $studentprojectrel->save();

                    // update invitation pending status to accepted
                    $invitation->status = 'accepted';

                    $invitation->save();

                    return redirect()->back()->with('success', 'Accepted successfully');
                }
                // if not registered already, redirect him/her to register form
                else {
                    // set student email to session
                    // redirect to register form
                    // \Session::set();
                    return redirect()->to('register?email=' . $email . '&role=student');
                }

            }
        } else {

            return redirect()->back()->with('error', 'Already  Accepted!');
        }
    }

    public function rejectinvitation(Request $request)
    {
        $projectID = $request->input('project_id');
        $rejmessage   = $request->input('message');

        $invitation = ProjectInvitation::where('id', $projectID)
            ->where('status', 'pending')
            ->first();
        if ($invitation) {
          $project_id = $invitation->project_id;

            if ($rejmessage) {
                $Project = Project::find($invitation->project_id);
                $user_id = \Auth::user()->id;
                $message          = new Message();
                $message->from    = $user_id;
                $message->to      = $Project->user->id;
                $message->message = $rejmessage;
                $message->save();

            }

            if ($invitation->invitee === 'supervisor') {
                // $student_id = $invitation->
                \DB::enableQueryLog();
                $user = \App\User::where('email', $invitation->email )
                    ->where('role', 'supervisor')
                    ->first();

                // echo '<pre>';
                // print_r(\DB::getQueryLog());
                // echo '</pre>';
                // dd($user);

                // check if this student is already registered, if yes, add this student to project relation table
                if ($user) {
                    // insert this invited student into student_project_rel table
                    $supervisorprojectrel                = new SupervisorProjectRel();
                    $supervisorprojectrel->supervisor_id = $user->id;
                    $supervisorprojectrel->project_id    = $project_id;

                    $supervisorprojectrel->save();

                    // update invitation pending status to accepted
                    $invitation->status = 'rejected';

                    $invitation->save();
                   echo json_encode(['type' => 'success', 'message' =>'Rejected successfully']);
                    exit;
                }
                // if not registered already, redirect him/her to register form
                else {
                   echo json_encode(['type' => 'error', 'url' =>'register?email=' . $email . '&role=supervisor']);
                    exit;
                    
                }
            }

            if ($invitation->invitee === 'student') {
                // $student_id = $invitation->
                \DB::enableQueryLog();
                $user = \App\User::where('email', $invitation->invitee )
                    ->where('role', 'student')
                    ->first();
                // echo '<pre>';
                // print_r(\DB::getQueryLog());
                // echo '</pre>';
                // dd($user);

                // check if this student is already registered, if yes, add this student to project relation table
                if ($user) {
                    // insert this invited student into student_project_rel table
                    $studentprojectrel             = new StudentProjectRel();
                    $studentprojectrel->student_id = $user->id;
                    $studentprojectrel->project_id = $project_id;

                    $studentprojectrel->save();

                    // update invitation pending status to accepted
                    $invitation->status = 'rejected';
                    $invitation->save();
                    echo json_encode(['type' => 'success', 'message' =>'Rejected successfully']);
                    exit;
                }
                // if not registered already, redirect him/her to register form
                else {
                   echo json_encode(['type' => 'error', 'url' =>'register?email=' . $email . '&role=supervisor']);
                    exit;
                }

            }
        } else {
           echo json_encode(['type' => 'success', 'message' =>'Already Accepted']);
                    exit;
        }
    }

    public function holdinvitation(Request $request)
    {
        $projectID = $request->input('project_id');
        $rejmessage   = $request->input('message');

        $invitation = ProjectInvitation::where('id', $projectID)
            ->where('status', 'pending')
            ->first();
        if ($invitation) {
          $project_id = $invitation->project_id;

            if ($rejmessage) {
                $Project = Project::find($invitation->project_id);
                $user_id = \Auth::user()->id;
                $message          = new Message();
                $message->from    = $user_id;
                $message->to      = $Project->user->id;
                $message->message = $rejmessage;
                $message->save();

            }

            if ($invitation->invitee === 'supervisor') {
                // $student_id = $invitation->
                \DB::enableQueryLog();
                $user = \App\User::where('email', $invitation->email )
                    ->where('role', 'supervisor')
                    ->first();

                // echo '<pre>';
                // print_r(\DB::getQueryLog());
                // echo '</pre>';
                // dd($user);

                // check if this student is already registered, if yes, add this student to project relation table
                if ($user) {
                    // insert this invited student into student_project_rel table
                    $supervisorprojectrel                = new SupervisorProjectRel();
                    $supervisorprojectrel->supervisor_id = $user->id;
                    $supervisorprojectrel->project_id    = $project_id;

                    $supervisorprojectrel->save();

                    // update invitation pending status to accepted
                    $invitation->status = 'hold';

                    $invitation->save();
                   echo json_encode(['type' => 'success', 'message' =>'Project on hold']);
                    exit;
                }
                // if not registered already, redirect him/her to register form
                else {
                   echo json_encode(['type' => 'error', 'url' =>'register?email=' . $email . '&role=supervisor']);
                    exit;
                    
                }
            }

            if ($invitation->invitee === 'student') {
                // $student_id = $invitation->
                \DB::enableQueryLog();
                $user = \App\User::where('email', $invitation->invitee )
                    ->where('role', 'student')
                    ->first();
                // echo '<pre>';
                // print_r(\DB::getQueryLog());
                // echo '</pre>';
                // dd($user);

                // check if this student is already registered, if yes, add this student to project relation table
                if ($user) {
                    // insert this invited student into student_project_rel table
                    $studentprojectrel             = new StudentProjectRel();
                    $studentprojectrel->student_id = $user->id;
                    $studentprojectrel->project_id = $project_id;

                    $studentprojectrel->save();

                    // update invitation pending status to accepted
                    $invitation->status = 'hold';
                    $invitation->save();
                    echo json_encode(['type' => 'success', 'message' =>'Project on hold']);
                    exit;
                }
                // if not registered already, redirect him/her to register form
                else {
                   echo json_encode(['type' => 'error', 'url' =>'register?email=' . $email . '&role=supervisor']);
                    exit;
                }

            }
        } else {
           echo json_encode(['type' => 'success', 'message' =>'Already Accepted']);
                    exit;
        }
    }
}
