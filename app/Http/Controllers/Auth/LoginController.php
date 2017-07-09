<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => 'logout']);
    }

    // addded later
    protected function authenticated($request, $user)
    {
      // dd($user);
      // die('here');

        // 'admin','supervisor','student'
        if($user->role === 'admin') {
            return redirect()->intended('/admin/dashboard');
        }

        if($user->role === 'supervisor') {
            return redirect()->intended('/supervisor/dashboard');
        }

        // default routing to student dashboard
        return redirect()->intended('/student/dashboard');
    }
}
