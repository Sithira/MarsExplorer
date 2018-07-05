<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PowerSourceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('powersource')->insert([
            [
                'rover_id' => 1,
                'name' => 'Nuclear generator',
                'current_level' => 3
            ],
            [
                'rover_id' => 2,
                'name' => 'Solar power',
                'current_level' => 10
            ],
            [
                'rover_id' => 3,
                'name' => 'Solar power',
                'current_level' => 45
            ],
            [
                'rover_id' => 4,
                'name' => 'Nuclear generator',
                'current_level' => 80
            ]
        ]);
    }
}
