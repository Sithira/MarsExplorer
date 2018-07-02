<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CopySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('copy')->insert([
            [
                'computer_id' => 1,
                'coordinate_id' => 1
            ],
            [
                'computer_id' => 2,
                'coordinate_id' => 2
            ],
            [
                'computer_id' => 3,
                'coordinate_id' => 3
            ],
            [
                'computer_id' => 4,
                'coordinate_id' => 4
            ]
        ]);
    }
}
