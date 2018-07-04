<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CommunicationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('communication')->insert([
            [
                'rover_id' => 1,
                'orbiter_id' => 1,
                'cmode' => 'UHF',
                'type' =>'INDIRECT',
                'band' => '10Mb'
            ],
            [
                'rover_id' => 2,
                'orbiter_id' => 2,
                'cmode' => 'x-band',
                'type' => 'INDIRECT',
                'band' => '100Mb'
            ],
            [
                'rover_id' => 3,
                'orbiter_id' => 3,
                'cmode' => 'x-band',
                'type' =>'INDIRECT',
                'band' => '250Mb'
            ],
            [
                'rover_id' => 4,
                'orbiter_id' => '',
                'cmode' => 'UHF',
                'type' => 'DIRECT',
                'band' => '10000bps'
            ]
        ]);
    }
}
