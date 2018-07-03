<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class InstrumentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('instrument')->insert([
            [
                //'id' => 1,
                'camera_id' => 1,
                'name' => 'LIBS',
                'purpose' => 'provide elemental compositions'
            ],
            [
                //'id' => 2,
                'camera_id' => 1,
                'name' => 'RMI',
                'purpose' => 'give high-resolution images'
            ],
            [
                //'id' => 1,
                'camera_id' => 2,
                'name' => 'LIBS',
                'purpose' => 'provide elemental compositions'
            ],
            [
                //'id' => 2,
                'camera_id' => 3,
                'name' => 'RMI',
                'purpose' => 'give high-resolution images'
            ]
        ]);
    }
}
