<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //MAST Cam
        DB::table('mast')->insert([
            [
                //'id' => 1,
                'camera_id' => 4
            ],
            [
                //'id' => 2,
                'camera_id' => 5
            ],
            [
                //'id' => 3,
                'camera_id' => 5
            ],
            [
                //'id' => 4,
                'camera_id' => 4
            ]
        ]);

        //HAZ Cam
        DB::table('haz')->insert([
            [
                //'id' => 1,
                'camera_id' => 1,
                'name' => 'HAZ 1'
            ],
            [
                //'id' => 2,
                'camera_id' => 1,
                'name' => 'HAZ 2'
            ],
            [
                //'id' => 1,
                'camera_id' => 2,
                'name' => 'HAZ 1'
            ]
        ]);

        //PanCam
        DB::table('pancam')->insert([
            [
                //'id' => 1,
                'camera_id' => 1
            ],
            [
                //'id' => 2,
                'camera_id' => 1
            ],
            [
                //'id' => 1,
                'camera_id' => 2
            ],
            [
                //'id' => 2,
                'camera_id' => 3
            ]
        ]);

        //MAHLI
        DB::table('mahli')->insert([
            [
                //'id' => 1,
                'camera_id' => 1
            ],
            [
                //'id' => 2,
                'camera_id' => 1
            ],
            [
                //'id' => 1,
                'camera_id' => 2
            ],
            [
                //'id' => 2,
                'camera_id' => 3
            ]
        ]);

        //MARDI
        DB::table('mardi')->insert([
            [
                //'id' => 1,
                'camera_id' => 8
            ],
            [
                //'id' => 2,
                'camera_id' => 8
            ],
            [
                //'id' => 1,
                'camera_id' => 9
            ],
            [
                //'id' => 2,
                'camera_id' => 9
            ]
        ]);

        //ChemCam
        DB::table('chemcam')->insert([
            [
                //'id' => 1,
                'camera_id' => 10
            ],
            [
                //'id' => 2,
                'camera_id' => 10
            ],
            [
                //'id' => 1,
                'camera_id' => 11
            ],
            [
                //'id' => 2,
                'camera_id' => 11
            ]
        ]);

        //NavCam
        DB::table('nav')->insert([
            [
                //'id' => 1,
                'camera_id' => 3,
                'name' => 'Cam 1'
            ],
            [
                //'id' => 2,
                'camera_id' => 3,
                'name' => 'Cam 2'
            ],
            [
                //'id' => 1,
                'camera_id' => 4,
                'name' => 'Cam 1'
            ],
            [
                //'id' => 2,
                'camera_id' => 4,
                'name' => 'Cam 2'
            ]
        ]);
    }
}
