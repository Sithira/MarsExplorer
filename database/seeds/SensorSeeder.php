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
                'name' => ' Mini-TES',
                'type' => 'Infrared spectrometer'
            ],
            [
                'rover_id' => 2,
                'name' => 'Mössbauer',
                'type' => 'spectrometer'
            ],
            [
                'rover_id' => 3,
                'name' => 'APXS',
                'type' => 'X-Ray spectrometer'
            ],
            [
                'rover_id' => 4,
                'name' => 'SAM',
                'type' => 'spectrometer'
            ]
        ]);
    }
}
