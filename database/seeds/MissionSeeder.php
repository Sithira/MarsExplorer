<?php

use Illuminate\Database\Seeder;

class MissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('mission')->insert([
            [
                //'id' => 1,
                'spacecraft_id' => 1 ,
                'name' => 'Mars Exploration Rover',
                'planet' => 'Mars',
                'year' => '2003/0707'
            ],
            [
                //'id' => 2,
                'spacecraft_id' => 2 ,
                'name' => 'Planetary Undersurface Tool',
                'planet' => 'Mars',
                'year' => '2003/05/06'
            ],
            [
                //'id' => 1,
                'spacecraft_id' => 3 ,
                'name' => 'Mars Pathfinder',
                'planet' => 'Mars',
                'year' => '1997/07/04'
            ],
            [
                //'id' => 2,
                'spacecraft_id' => 4 ,
                'name' => 'Mars Science Laboratory',
                'planet' => 'Mars',
                'year' => '2011/11/26'
            ]
        ]);
    }
}
