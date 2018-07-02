<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class InteriorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('interior')->insert([
            [
                'radiation_id' => 1,
                'distance' => 500000.0
            ],
            [
                'radiation_id' => 2,
                'distance' => 800000.0
            ],
            [
                'radiation_id' => 3,
                'distance' => 20000.0
            ],
            [
                'radiation_id' => 4,
                'distance' => 100000.0
            ]
        ]);
    }
}
