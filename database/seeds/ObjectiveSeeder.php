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
        DB::table('objective')->insert([
            [
                'id' => 1,
                'mission_id' => 1,
                'name' => 'adda ada fmel',
                'type' => 'Planetary Process',
                'description' => 'aajvos adodvda dom lmd daosid sdpin'
            ],
            [
                'id' => 2,
                'mission_id' => 2,
                'name' => 'addfdea aaa fal',
                'type' => 'Biological',
                'description' => 'knca kan oua aoa ja aca ddad ladpia'
            ],
        ]);
    }
}
