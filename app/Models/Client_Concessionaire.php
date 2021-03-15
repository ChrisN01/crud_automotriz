<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Client_Concessionaire extends Model
{
    protected $table = 'client_concessionaire';

    protected $fillable = [
        'client_id','concessionaire_id'
    ];
}
