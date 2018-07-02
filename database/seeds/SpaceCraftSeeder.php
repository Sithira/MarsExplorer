<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SpaceCraftSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('spacecraft')->insert([
            [
                'name' =>'Mars 2' ,
                'country' => 'China'
            ],
            [
                'name' =>'Mars Pathfinder' ,
                'country' => 'USA'
            ],
            [
                'name' =>'Mars 3' ,
                'country' => 'China'
            ],
            [
                'name' =>'Beagle 2' ,
                'country' => 'Russia'
            ]
        ]);
    }
}
