<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
DB::setDateFormat('MM/DD/YYYY');
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
                'year' => '07/07/2003'
            ],
            [
                //'id' => 2,
                'spacecraft_id' => 2 ,
                'name' => 'Planetary Undersurface Tool',
                'planet' => 'Mars',
                'year' => '05/06/2003'
            ],
            [
                //'id' => 1,
                'spacecraft_id' => 3 ,
                'name' => 'Mars Pathfinder',
                'planet' => 'Mars',
                'year' => '07/04/1997'
            ],
            [
                //'id' => 2,
                'spacecraft_id' => 4 ,
                'name' => 'Mars Science Laboratory',
                'planet' => 'Mars',
                'year' => '11/26/2011'
            ]
        ]);
    }
}
