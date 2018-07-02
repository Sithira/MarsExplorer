<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RadiationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('radiation')->insert([
            [
                'coordinate_id' => 1,
                'radlevel' => '200mrad/d',
                'type' => 'cosmic'
            ],
            [
                'coordinate_id' => 2,
                'radlevel' => '100mrad/d',
                'type' => 'cosmic'
            ],
            [
                'coordinate_id' => 3,
                'radlevel' => '25mrad/d',
                'type' => 'gamma'
            ],
            [
                'coordinate_id' => 4,
                'radlevel' => '50mrad/d',
                'type' => 'X'
            ]
        ]);
    }
}
