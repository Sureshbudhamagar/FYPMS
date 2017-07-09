<?php

namespace App\Http\Controllers\Student;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Task;
use App\Models\Submission;
use App\Models\SubmissionComment;

class TaskController extends Controller
{
    public function assignment()
    {
      // get supervisor and project (whose supervisor has already accepted invitation) of the project creator
      $user_id = \Auth::user()->id;
      $supervised_projects = \DB::table('users')
                ->join('project', 'project.created_by', '=', 'users.id')
                ->join('supervisor_project_rel as spr', 'spr.project_id', '=', 'project.id')
                ->where('users.id', '=', $user_id)
                ->select('spr.supervisor_id', 'project.id as project_id', 'project.title', 'project.code', 'project.created_by')
                ->get();

      // dd($supervised_projects);

      // list all task related to that project and supervisor of the current logged in student
      $projects = [];

      // dd($supervised_projects);

      foreach($supervised_projects as $key=>$sp) {

        // get project tasks
        $tasks = Task::where('supervisor_id', '=', $sp->supervisor_id)
                    ->where('project_id', '=', $sp->project_id)
                    ->orderBy('id', 'desc')
                    ->get();

        if(count($tasks) > 0) {
          $projects[$key] = $sp;

          // get supervisor name
          $supervisor = \DB::table('users')->where('id', '=', $sp->supervisor_id)->first();
          $projects[$key]->supervisor = $supervisor->fname . ' ' . $supervisor->lname;


          $projects[$key]->tasks = $tasks;

          // find if submission is already done for that task by this particular student. (match task_id and student_id)
          foreach($tasks as $tkey=>$task) {
            $submissions = Submission::where('task_id',$task->id)->where('student_id',$sp->created_by)->first();  
            $tasks[$tkey]->submission = $submissions;
          }
          
        }


      }

      return view('student/task/list', compact('projects'));
    }

    public function done($task_id)
    {
      $student_id = \Auth::user()->id;

      \DB::enableQueryLog();

       $task = Task::find($task_id);     

      //dd(\DB::getQueryLog());
      // dd($assigned_to_this_student);

      // retrieve task detail and display form to submit task assignment
      if($task) {
         // verify is this task belong to (is assigned) to the current logged in student or not.
        $assigned_to_this_student = \DB::table('users')
                ->join('project', 'project.created_by', '=', 'users.id')
                ->join('supervisor_project_rel as spr', 'spr.project_id', '=', 'project.id')
                ->where('users.id', '=', $student_id)
                ->where('project.status', 1)
                ->where('project.id', '=', $task->project_id)
                ->select('spr.supervisor_id', 'project.id as project_id', 'project.title', 'project.code', 'project.status')
                ->first();

         /*if project  is not accepted by admin*/
         if(isset($assigned_to_this_student) && $assigned_to_this_student->status != 1)
         return view('student/task/undone', compact('task'));
        
        // get submission_id if submitted already
        $submission = Submission::where('task_id', $task_id)
        ->where('student_id', $student_id)
        ->first();

        // get lists of comments if any
        $comments = SubmissionComment::join('users', 'users.id', '=', 'submission_comment.commented_by')
        ->join('submission', 'submission.id', '=', 'submission_comment.submission_id')
        ->where('submission.task_id', $task_id)
        ->where('submission.student_id', $student_id)
        ->select('submission_comment.*', 'users.role', 'users.fname', 'users.lname')
        ->orderBy('submission_comment.id', 'asc')
        ->get()
        ;



        return view('student/task/done', compact('task', 'comments', 'submission'));
      } else {
        exit('Sorry you are not assigned to this task.');
      }
    }
}
