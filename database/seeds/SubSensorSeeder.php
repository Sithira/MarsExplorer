<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SubSensorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('subsensor')->insert([
            [
                'subsensor_id' => 1,
                'name' => 'chemical temperature'
            ],
            [
                'subsensor_id' => 2,
                'name' => 'optical sensor'
            ],
            [
                'subsensor_id' => 3,
                'name' => 'chemical temperature'
            ],
            [
                'subsensor_id' => 4,
                'name' => 'optical sensor'
            ]
        ]);
    }
}
