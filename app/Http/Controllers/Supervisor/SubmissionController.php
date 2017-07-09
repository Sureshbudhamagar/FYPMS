<?php

namespace App\Http\Controllers\Supervisor;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Submission;
use App\Models\Task;
use App\Models\SubmissionComment;

class SubmissionController extends Controller
{
    // list of task submisions submitted by students for the respective task
    public function index($task_id)
    {
      // list all submissions by that task id, retrieve student name as well.
      // echo $task_id;

      $task = Task::find($task_id);

      $submissions = Submission::join('users', 'users.id', '=', 'submission.student_id')
        ->where('task_id', $task_id)
        ->select('submission.*', 'users.fname', 'users.lname', 'users.email')
        ->orderBy('submission.id', 'desc')
        ->get();

      // dd($submissions);

      if(!$submissions) {
        abort(404);
      }

      return view('supervisor/submission/list', compact('submissions', 'task'));
    }

    public function detail($id)
    {
      // $task = Submission::join('tasks', 'tasks.id', '=', 'submission.task_id')
      //   ->where('submission.task_id', $task_id)
      //   ->select('tasks.title', 'tasks.deadline', 'submission.fname', 'users.lname', 'users.email')
      //   ->orderBy('submission.id', 'desc')
      //   ->get();

      $submission = Submission::join('users', 'users.id', '=', 'submission.student_id')
          ->join('tasks', 'tasks.id', '=', 'submission.task_id')
          ->where('submission.id', $id)
          ->select('submission.*', 'users.fname', 'users.lname', 'users.email', 'tasks.title', 'tasks.deadline')
          ->first();

      // dd($submission);


      // $submission = Submission::join('users', 'users.id', '=', 'submission.student_id')
      //   ->where('submission.id', $id)
      //   ->select('submission.*', 'users.fname', 'users.lname', 'users.email')
      //   ->first();

      // load comments
      $comments = SubmissionComment::join('users', 'users.id', '=', 'submission_comment.commented_by')
        ->where('submission_comment.submission_id', $id)
        ->select('submission_comment.*', 'users.role', 'users.fname', 'users.lname', 'users.id as uid')
        ->orderBy('submission_comment.id', 'asc')
        ->get();

      return view('supervisor/submission/detail', compact('submission', 'comments'));
    }

    public function comment(Request $request, $submission_id)
    {
      $commented_by = \Auth::user()->id;

      $comment = new SubmissionComment();
      $comment->comment = $request->comment;
      $comment->commented_by = $commented_by;
      $comment->submission_id = $submission_id;

      $comment->save();

      

      return redirect()->back()->with('success', 'Comment posted successfully');

    }
}
