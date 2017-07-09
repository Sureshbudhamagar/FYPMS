<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ProjectInvitation extends Mailable
{
    use Queueable, SerializesModels;

    public $project_id;
    public $invited_by_email;
    public $msg;
    public $subject;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        //
        $this->project_id = $data['project_id'];
        $this->invited_by_email = $data['invited_by_email'];
        $this->msg = nl2br($data['message']);
        $this->name = $data['name'];
        $this->subject = $data['subject'];
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        // return $this->view('view.name');

        $address = $this->invited_by_email;
        $name = $this->name;
        $subject = $this->subject;

        return $this->view('emails.projectinvitation')
                ->from($address, $name)
                // ->cc($address, $name)
                // ->bcc($address, $name)
                // ->replyTo($address, $name)
                ->subject($subject);
    }
}
