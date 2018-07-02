<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CoordinatesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('coordinates')->insert([
            [
                'computer_id' => 1,
                'data' => '48.218830° N, 234.250778° E'
            ],
            [
                'computer_id' => 2,
                'data' => '34.218830°N, 154.250778°E'
            ],
            [
                'computer_id' => 3,
                'data' => '61.218830° N, 134.250778° E'
            ],
            [
                'computer_id' => 4,
                'data' => '58.218830° N, 244.250778° E'
            ]
        ]);
    }
}
