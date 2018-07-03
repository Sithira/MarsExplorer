<?php

use Illuminate\Database\Seeder;

class SensorTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('sensortype')->insert([
            [
                //'id' => 1,
                'type' => 'Infrared spectrometer'
            ],
            [
                //'id' => 2,
                'type' => 'spectrometer'
            ],
            [
                //'id' => 3,
                'type' => 'X-Ray spectrometer'
            ],
            [
                //'id' => 3,
                'type' => 'spectrometer'
            ]
        ]);
    }
}
