<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

//Modelo para concessionaires
class Concessionaire extends Model
{
    protected $fillable = [
        'name','address', 'location_id',
    ];

     /*Defining Relationships - Definicion de relaciones */
    
    public function location(){
        return $this->belongsTo('App\Models\Location');
    }

    public function clients()
    {
        return $this->hasMany('App\Models\Client');
    }
}
