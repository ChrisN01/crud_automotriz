<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Client;
use Faker\Generator as Faker;

$factory->define(Client::class, function (Faker $faker) {
    return [
        'name'  => $faker->name,
        'dni' => $faker->dni,
        'address' => $faker->address,
        'phone' => $faker->phone,
        'concessionaire_id' => \App\Models\Concessionaire::all()->random()->id, User::all()->random()->id
    ];
});
