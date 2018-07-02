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
                'apxs_id' => 1,
                'name' => 'chemical temperature'
            ],
            [
                'apxs_id' => 2,
                'name' => 'optical sensor'
            ],
            [
                'apxs_id' => 3,
                'name' => 'chemical temperature'
            ],
            [
                'apxs_id' => 4,
                'name' => 'optical sensor'
            ]
        ]);
    }
}
