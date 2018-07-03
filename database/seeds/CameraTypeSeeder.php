<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CameraTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('cameratype')->insert([
            [
                //'id' => 1,
                'type' => 'HazCam'
            ],
            [
                //'id' => 2,
                'type' => 'NavCam'
            ],
            [
                //'id' => 3,
                'type' => 'MastCam'
            ],
            [
                //'id' => 4,
                'type' => 'MAHLI'
            ],
            [
                //'id' => 4,
                'type' => 'MARDI'
            ],
            [
                //'id' => 4,
                'type' => 'ChemCam'
            ],
            [
                //'id' => 4,
                'type' => 'PanCam'
            ]
        ]);
    }
}
