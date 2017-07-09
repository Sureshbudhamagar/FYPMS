<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectInvitation extends Model
{
    //
    protected $table = 'project_invitation';

       function projectinvitation()
    {
        return $this->belongsto('App\Models\Project', 'project_id');
    }
}
