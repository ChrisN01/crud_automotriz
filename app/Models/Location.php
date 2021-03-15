<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

//Modelo para locations
class Location extends Model
{
    protected $fillable = [
        'name',
    ];

    /*Defining Relationships - Definicion de relaciones */
    public function concessionaires()
    {
        return $this->hasMany('App\Models\Concessionaire');
    }
    public function clients()
    {
        return $this->hasMany('App\Models\Client');
    }
}
