<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
         //$this->call(OrbiterSeeder::class);
         $this->call(StorageSeeder::class);
         $this->call(MissionSeeder::class);
         $this->call(RoverSeeder::class);
         $this->call(CameraSeeder::class);
         $this->call(ImageSeeder::class);
         $this->call(CamSeeder::class);
         $this->call(MiniTesSeeder::class);
         $this->call(InstrumentSeeder::class);
    }
}
