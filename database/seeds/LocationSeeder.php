<?php

use Illuminate\Database\Seeder;

class LocationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('locations')->insert([
            'name' => 'Lima',
        ]);
        
        DB::table('locations')->insert([
            'name' => 'Arequipa',
        ]);
        DB::table('locations')->insert([
            'name' => 'Callao',
        ]);
        DB::table('locations')->insert([
            'name' => 'Chiclayo',
        ]);
        DB::table('locations')->insert([
            'name' => 'Trujillo',
        ]);
        DB::table('locations')->insert([
            'name' => 'Piura',
        ]);
        DB::table('locations')->insert([
            'name' => 'Huancayo',
        ]);
        DB::table('locations')->insert([
            'name' => 'Cuzco',
        ]);
        DB::table('locations')->insert([
            'name' => 'Chimbote',
        ]);
        DB::table('locations')->insert([
            'name' => 'Iquitos',
        ]);
        DB::table('locations')->insert([
            'name' => 'Pucallpa',
        ]);
        DB::table('locations')->insert([
            'name' => 'Tacna',
        ]);
        
    }
}
