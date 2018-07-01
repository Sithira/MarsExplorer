<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OrbiterSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('orbiter')->insert([
            [
                'id' => 1,
                'cmode' =>'x-band' ,
                'type' => 'dfbd',
                'band' => 'vsv',
                'planet' => 'Mars',
                'isMalFunctioning' => 0
            ],
            [
                'id' => 2,
                'cmode' =>'x-band' ,
                'type' => 'dfbd',
                'band' => 'vsv',
                'planet' => 'Mars',
                'isMalFunctioning' => 1
            ]
        ]);
    }
}
