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
                'cmode' =>'x-band' ,
                'type' => 'Opportunity Orbiter',
                'band' => '500bps',
                'planet' => 'Mars',
                'isMalFunctioning' => 0
            ],
            [
                'cmode' =>'UHF' ,
                'type' => 'Beagle Orbiter',
                'band' => '1500bps',
                'planet' => 'Mars',
                'isMalFunctioning' => 1
            ],
            [
                'cmode' =>'x-band' ,
                'type' => 'Odyssey Orbiter',
                'band' => '320000bps',
                'planet' => 'Mars',
                'isMalFunctioning' => 0
            ],
            [
                'cmode' =>'UHF' ,
                'type' => 'Curiosity Orbiter',
                'band' => '10000bps',
                'planet' => 'Mars',
                'isMalFunctioning' => 1
            ]
        ]);
    }
}
