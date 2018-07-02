<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StorageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('storage')->insert([
            [
                //'id' => 1,
                'type' => 'A',
                'capacity' => '100TB'
            ],
            [
                //'id' => 1,
                'type' => 'B',
                'capacity' => '500TB'
            ],
            [
                //'id' => 1,
                'type' => 'C',
                'capacity' => '1000TB'
            ]
        ]);
    }
}
