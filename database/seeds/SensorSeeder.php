<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SensorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('sensor')->insert([
            [
                'rover_id' => 1,
                'parent_id' => 1,
                'camera_id' => 1,
                'sensor_type_id' => 1,
                'name' => 'Mini-TES'
            ],
            [
                'rover_id' => 2,
                'parent_id' => 1,
                'camera_id' => 2,
                'sensor_type_id' => 2,
                'name' => 'Mössbauer'
            ],
            [
                'rover_id' => 3,
                'parent_id' => 1,
                'camera_id' => 3,
                'sensor_type_id' => 3,
                'name' => 'APXS'
            ],
            [
                'rover_id' => 4,
                'parent_id' => 1,
                'camera_id' => 4,
                'sensor_type_id' => 4,
                'name' => 'SAM'
            ]
        ]);
    }
}
