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
                'id' => 1,
                'name' =>'Mars 2' ,
                'country' => 'China'
            ],
            [
                'id' => 2,
                'name' =>'Sojourner' ,
                'country' => 'USA'
            ],
        ]);
    }
}
