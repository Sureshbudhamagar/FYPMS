<?php

namespace App\Http\Controllers\student;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Submission;
use App\Models\Task;
use App\Models\SubmissionComment;

class SubmissionController extends Controller
{
    //public function submit($task_id)
    public function submit($task_id, Request $request)
    {
      $task = Task::find($task_id);




      // $request = new Request();

      if(!$task) {
        die('Invalid task');
      }


      // find if late or ontime submission
      $deadline = $task->deadline;
      $time_remaining = time_remaining_string($deadline);
      $diff = $time_remaining[1];

      if($diff < 0) {
        $status = 'late';
      } else {
        $status = 'ontime';
      }

      $student_id = \Auth::user()->id;

      $submission = new Submission();

      $submission->student_id = $student_id;
      $submission->task_id = $task_id;
      $submission->status = $status;

      // echo 'ss = ' . $request->file('attachment');
      // echo '<br>att = ' . $request->attachment;
      // echo '<br>';
      // dd($request);

      $this->validate($request, [
            // 'title' =>  'required',
            // 'deadline'  =>  'required'
            'attachment' => 'required|mimes:doc,docx,pdf,txt,sql|max:2048'
      ]);



      // $file = '';
      $attachment = '';
      if($request->attachment) {
                      // save to public path
                      $dir = 'files/submission';
                      $file = time().'.'.$request->attachment->getClientOriginalExtension();
                      // $request->image->move(public_path($dir), $file);
                      $filefullpath = $request->file('attachment')->move(public_path($dir), $file);
                      $attachment = '/' . $dir . '/' . $file;


                      // save to storage path
                      // $file = $request->file('attachment')->store('task');


      }

      // $submission->attachment = $file;
      $submission->attachment = $attachment;

      // dd($submission);

      $status = $submission->save();

      if($status) {
        $request->session()->flash('alert-success', 'Assignment Submitted Successfully!');
      } else {
        $request->session()->flash('alert-error', 'Error Submitting Assignment!');
      }

      return redirect()->back();

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
