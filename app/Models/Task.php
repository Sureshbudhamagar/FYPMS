<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    //
    protected $table    = 'tasks';
    protected $fillable = [
    'supervisor_id',
    'project_id',
    'title',
    'descr',
    'attachment',
    'deadline',
    ];



    function submission()
    {
        return $this->hasMany('App\Models\Submission', 'task_id');
    }
}
