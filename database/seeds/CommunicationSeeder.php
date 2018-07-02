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
                'type' =>'aadfa',
                'band' => 'cadcc'
            ],
            [
                'rover_id' => 2,
                'orbiter_id' => 2,
                'cmode' => 'x-band',
                'type' => 'dcwc',
                'band' => 'cwdcb'
            ],
            [
                'rover_id' => 3,
                'orbiter_id' => 3,
                'cmode' => 'x-band',
                'type' =>'wwwcw',
                'band' => 'kknk'
            ],
            [
                'rover_id' => 4,
                'orbiter_id' => 4,
                'cmode' => 'UHF',
                'type' => 'slnsln',
                'band' => 'scsjb'
            ]
        ]);
    }
}
