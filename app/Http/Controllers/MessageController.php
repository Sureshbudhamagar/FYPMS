<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Message;
use App\User;

class MessageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function inbox()
    {
      // student or supervisor id
      $user_id = \Auth::user()->id;

      \DB::enableQueryLog();

      // get all messages related to this user.
      // $messages = Message::join('users as ufrom', 'ufrom.id', '=', 'messages.to')
      // ->join('users as uto', 'uto.id', '=', 'messages.to')
      // ->where('from', $user_id)
      // ->orWhere('to', $user_id)
      // ->select(
      //   'messages.*',
      //   'ufrom.fname as fromfname',
      //   'ufrom.lname as fromlname',
      //   'uto.fname as tofname',
      //   'uto.lname as tolname'
      //   )
      // ->orderBy('messages.id', 'desc')
      // ->get();

      $frommessages = \DB::select("select `messages`.*,
(SELECT `users`.`fname` from users WHERE users.id=messages.from) as fromfname,
(SELECT `users`.`lname` from users WHERE users.id=messages.from) as fromlname,
(SELECT `users`.`fname` from users WHERE users.id=messages.to) as tofname,
(SELECT `users`.`fname` from users WHERE users.id=messages.to) as tolname
 from `messages` inner join `users` as `ufrom` on `ufrom`.`id` = `messages`.`to` inner join `users` as `uto` on `uto`.`id` = `messages`.`to` where `from` = '$user_id' order by `messages`.`id` desc
");      

      $tomessages = \DB::select("select `messages`.*,
(SELECT `users`.`fname` from users WHERE users.id=messages.from) as fromfname,
(SELECT `users`.`lname` from users WHERE users.id=messages.from) as fromlname,
(SELECT `users`.`fname` from users WHERE users.id=messages.to) as tofname,
(SELECT `users`.`fname` from users WHERE users.id=messages.to) as tolname
 from `messages` inner join `users` as `ufrom` on `ufrom`.`id` = `messages`.`to` inner join `users` as `uto` on `uto`.`id` = `messages`.`to` where `to` = '{$user_id}' order by `messages`.`id` desc
");

      // dd(\DB::getQueryLog());

      // dd($messages);

      $receipients = User::where('id', '!=', $user_id)->orderBy('fname', 'asc')->get();

      return view('message/inbox', compact('frommessages','tomessages', 'receipients'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user_id = \Auth::user()->id;

        $message = new Message();

        $message->from = $user_id;
        $message->to = $request->to;
        $message->message = $request->message;

        $message->save();

        $request->session()->flash('alert-success', 'Message Sent!');
        return redirect()->back();
    }

    public function mark(Request $request, $message_id)
    {
      $message = Message::find($message_id);
      // $message = Message::where('id', $message_id)->select('status')->first();

      if($message->status == 0) {
        $status = 1;
      } else {
        $status = 0;
      }

      $message->status = $status;

      $message->update();

      $request->session()->flash('alert-success', 'Status changed!');

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
        //
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
        //
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
