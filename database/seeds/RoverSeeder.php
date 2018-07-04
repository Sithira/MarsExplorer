<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoverSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('rover')->insert([
            [
                //'id' => 1,
                'mission_id' => 1,
                'name' => 'Opportunity',
                'state' => 'DEPLOYING',
                'width' => '2.3m',
                'height' => '1.5m',
                'length' => '1.6m',
                'wheel_count' => 6
            ],
            [
                //'id' => 2,
                'mission_id' => 2,
                'name' => 'Beagle 2',
                'state' => 'LANDED',
                'width' => '1m',
                'height' => '0.25m',
                'length' => '1.5m',
                'wheel_count' => 4
            ],
            [
                //'id' => 1,
                'mission_id' => 3,
                'name' => 'Sojourner',
                'state' => 'READY',
                'width' => '0.7m',
                'height' => '1m',
                'length' => '0.65m',
                'wheel_count' => 6
            ],
            [
                //'id' => 2,
                'mission_id' => 4,
                'name' => 'Curiosity',
                'state' => '',
                'width' => '2.7m',
                'height' => '2.2m',
                'length' => '2.9',
                'wheel_count' => 6
            ]
        ]);
    }
}
