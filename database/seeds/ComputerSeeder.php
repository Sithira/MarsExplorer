<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ComputerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('computer')->insert([
            [
                'rover_id' => 1,
                'eeprom' => '2GB',
                'dram' =>'500MB',
                'flash' => '1GB'
            ],
            [
                'rover_id' => 2,
                'eeprom' => '3GB',
                'dram' => '125MB',
                'flash' => '2GB'
            ],
            [
                'rover_id' => 3,
                'eeprom' => '2GB',
                'dram' =>'250MB',
                'flash' => '1GB'
            ],
            [
                'rover_id' => 4,
                'eeprom' => '4GB',
                'dram' => '125MB',
                'flash' => '1GB'
            ]
        ]);
    }
}
