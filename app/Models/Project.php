<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    //
    protected $table = 'project';
    protected $fillable =  [
        'code',
        'title',
        'abstract',
        'subject_area',
        'objectives',
        'deliverables',
        'environment',
        'image',
        'status',
    ];

    function projectinvitation()
    {
        return $this->hasMany('App\Models\ProjectInvitation', 'project_id');
    }

    function user()
    {
        return $this->belongsTo('App\User', 'created_by');
    }
}
