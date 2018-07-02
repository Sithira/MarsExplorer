<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ObjectiveSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('objectives')->insert([
            [
                'mission_id' => 1,
                'name' => 'Determine present state, distribution, and cycling of water and carbon dioxide',
                'type' => 'Planetary Process',
                'description' => 'aajvos adodvda dom lmd daosid sdpin'
            ],
            [
                'mission_id' => 2,
                'name' => 'Determine the nature and inventory of organic carbon compounds',
                'type' => 'Biological',
                'description' => 'knca kan oua aoa ja aca ddad ladpia'
            ],
            [
                'mission_id' => 3,
                'name' => 'Interpret the processes that have formed and modified rocks and soils',
                'type' => 'Geological and geochemical',
                'description' => 'aajvos adodvda dom lmd daosid sdpin'
            ],
            [
                'mission_id' => 4,
                'name' => 'Measure Surface and interior radiation of the journey',
                'type' => 'Surface rdiation',
                'description' => 'knca kan oua aoa ja aca ddad ladpia'
            ],
        ]);
    }
}
