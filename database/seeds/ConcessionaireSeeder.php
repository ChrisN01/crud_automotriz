<?php

use Illuminate\Database\Seeder;

class ConcessionaireSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('concessionaires')->insert([
            'name' => 'Concesionario 1',
            'address' => '170 Leannon Place
            Port Theresiabury, MI 87589',
            'location_id' => 3,
        ]);
        DB::table('concessionaires')->insert([
            'name' => 'Concesionario 2',
            'address' => '5779 Botsford Port
            Moenmouth, PA 50570-8007',
            'location_id' => 3,
        ]);
        DB::table('concessionaires')->insert([
            'name' => 'Concesionario 3',
            'address' => '9098 Murazik Ridges
            Blickburgh, OR 85446',
            'location_id' => 3,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 4',
            'address' => '50373 Schiller Village
            North Katherinestad, WI 785',
            'location_id' => 5,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 5',
            'address' => '482 Berenice Stream
            North Rosemary, MI 39888',
            'location_id' => 1,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 6',
            'address' => '25237 Sawayn Keys
            Lubowitzmouth, IA 25689-7136',
            'location_id' => 1,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 7',
            'address' => '775 Goldner Port Suite 096
            Ondrickahaven, AR 08954',
            'location_id' => 7,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 8',
            'address' => '18320 Koepp Curve
            Port Patienceborough, NC 38974',
            'location_id' => 7,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 9',
            'address' => '65525 Kuvalis Fort Suite 642
            New Sylviaside, AZ 20',
            'location_id' => 1,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 10',
            'address' => '466 Fae Ports Apt. 199
            Port Unique, MA 24253',
            'location_id' => 4,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 11',
            'address' => '3805 Flo Crescent Suite 780
            East Scot, ID 03742',
            'location_id' => 9,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 12',
            'address' => '104 Lenora Garden Suite 505
            South Jessyca, ME 7956',
            'location_id' => 11,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 13',
            'address' => '9226 Letha Centers Apt. 754
            Port Joan, OR 47307',
            'location_id' => 1,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 14',
            'address' => '329 Nitzsche Glen
            Joaniemouth, SD 62385',
            'location_id' => 1,
        ]);DB::table('concessionaires')->insert([
            'name' => 'Concesionario 15',
            'address' => '3468 Collier Unions
            North Marta, MO 32794-8572',
            'location_id' => 12,
        ]);
    }
}
