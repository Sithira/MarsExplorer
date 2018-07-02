<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MossbauerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('mossbauer')->insert([
            [
                'sensor_id' => 1
            ],
            [
                'sensor_id' => 2
            ],
            [
                'sensor_id' => 3
            ],
            [
                'sensor_id' => 4
            ]
        ]);
    }
}
