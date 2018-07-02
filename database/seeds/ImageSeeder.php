<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ImageSeeder extends Seeder
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
                'camera_id' => 1 ,
                'storage_id' => 1,
                'significance' => 75,
                'resolution' => '1600 x 1200'
            ],
            [
                //'id' => 2,
                'camera_id' => 2 ,
                'storage_id' => 2,
                'significance' => 55,
                'resolution' => '3840 x 2160'
            ],
            [
                //'id' => 1,
                'camera_id' => 3 ,
                'storage_id' => 2,
                'significance' => 60,
                'resolution' => '4096 x 2160'
            ],
            [
                //'id' => 2,
                'camera_id' => 4 ,
                'storage_id' => 3,
                'significance' => 32,
                'resolution' => '1280 x 720'
            ]
        ]);
    }
}
