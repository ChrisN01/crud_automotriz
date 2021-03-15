<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//Modelo para clients
class Client extends Model
{
    protected $fillable = [
        'name', 'dni', 'address','phone','concessionaire_id', 'status',
    ];

     /*Defining Relationships - Definicion de relaciones */
     public function concessionaire()
     {
         return $this->belongsTo('App\Models\Concessionaire');
     }
     public function location()
     {
         return $this->belongsTo('App\Models\Location');
     }
}
