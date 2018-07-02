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
                'name' => 'Nuclear generator'
            ],
            [
                'rover_id' => 2,
                'name' => 'Solar power'
            ],
            [
                'rover_id' => 3,
                'name' => 'Solar power'
            ],
            [
                'rover_id' => 4,
                'name' => 'Nuclear generator'
            ]
        ]);
    }
}
