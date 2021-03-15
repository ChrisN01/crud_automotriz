<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        
        $this->call(LocationSeeder::class);
        $this->call(ConcessionaireSeeder::class);
        /*Crear usuario administrador*/
        factory(App\Models\User::class, 1)->create([
            'name' =>'ADMINISTRADOR',
            'email' => 'admin@mail.com',
            'password' => bcrypt('123456'),

        ]);
        //factory('App\Models\Concessionaire', 15)->create();
    }
}
