<?php

namespace App\Http\Controllers\Student;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Models\Project;
use App\Models\StudentProject;
use App\Models\SupervisorProject;
use App\Models\ProjectInvitation;
use Auth;

class DashboardController extends Controller
{
    //
    public function index()
    {
      return view('student/dashboard');
    }


    public function studentList(Request $request)
    {
      $querysearch = $request->input('query');

      $students = User::where('email','like', '%' . $querysearch . '%')
				      ->where('id','!=',Auth::user()->id)
				      ->where('role','student')
				      ->get();
				      
       foreach ($students as $key => $student) {
            $temp['id'] = $student->id;
            $temp['name'] = $student->email;            
            $searchstudent[] = $temp;
        }

        return response()->json($searchstudent);

    }

    public function supervisorList(Request $request)
    {
      $querysearch = $request->input('query');

      $students = User::where('email','like', '%' . $querysearch . '%')
				      ->where('id','!=',Auth::user()->id)
				      ->where('role','supervisor')
				      ->get();

       foreach ($students as $key => $student) {
            $temp['id'] = $student->id;
            $temp['name'] = $student->email;            
            $searchstudent[] = $temp;
        }

        return response()->json($searchstudent);

    }
}
