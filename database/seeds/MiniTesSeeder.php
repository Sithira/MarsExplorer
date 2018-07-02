<?php

use Illuminate\Database\Seeder;

class MiniTesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('minites')->insert([
            [
                //'id' => 1,
                'sensor_id' => 1,
                'nav_id' => 1
            ],
            [
                //'id' => 2,
                'sensor_id' => 2,
                'nav_id' => 2
            ],
            [
                //'id' => 2,
                'sensor_id' => 3,
                'nav_id' => 3
            ],
            [
                //'id' => 2,
                'sensor_id' => 4,
                'nav_id' => 4
            ]
        ]);
    }
}
