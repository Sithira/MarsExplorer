<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SurfaceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('surface')->insert([
            [
                'radiation_id' => 1,
                'landingsite' => 'Aeolis Palus'
            ],
            [
                'radiation_id' => 2,
                'landingsite' => 'Peace Vallis'
            ],
            [
                'radiation_id' => 3,
                'landingsite' => 'Aeolis Mons'
            ],
            [
                'radiation_id' => 4,
                'landingsite' => 'Gale Crater'
            ]
        ]);
    }
}
