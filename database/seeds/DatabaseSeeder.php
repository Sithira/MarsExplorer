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

         $this->call(SpaceCraftSeeder::class);
         $this->call(OrbiterSeeder::class);
         $this->call(StorageSeeder::class);
         $this->call(MissionSeeder::class);
         $this->call(ObjectiveSeeder::class);
         $this->call(RoverSeeder::class);
         $this->call(ComputerSeeder::class);
         $this->call(CommunicationSeeder::class);
         $this->call(CameraTypeSeeder::class);
         $this->call(CameraSeeder::class);
         $this->call(ImageSeeder::class);
         $this->call(CoordinatesSeeder::class);
         $this->call(CopySeeder::class);
         $this->call(RadiationSeeder::class);
         $this->call(SurfaceSeeder::class);
         $this->call(InteriorSeeder::class);
         //$this->call(CamSeeder::class);
         $this->call(InstrumentSeeder::class);
         $this->call(SensorTypeSeeder::class);
         $this->call(SensorSeeder::class);
         //$this->call(APXSSeeder::class);
         //$this->call(MiniTesSeeder::class);
         //$this->call(MossbauerSeeder::class);
         $this->call(PowerSourceSeeder::class);
         //$this->call(SubSensorSeeder::class);
    }
}
