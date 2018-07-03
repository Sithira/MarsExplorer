<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MastSubCameraSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('images')->insert([
            [
                //'id' => 1,
                'camera_id' => 1,
                'name' => 'MAC',
                'yield' => '22cm/pixel',
                'scale' => '1km'
            ],
            [
                //'id' => 2,,
                'camera_id' => 2,
                'name' => 'NAC',
                'yield' => '7.4cm/pixel',
                'scale' => '1km'
            ]
        ]);
    }
}
