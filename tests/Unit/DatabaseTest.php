<?php

namespace Tests\Unit;

use DB;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class DatabaseTest extends TestCase
{

    public function testPowerSource()
    {
        $this->assertDatabaseHas('powersource',
            [
                'id' => '1',
                'rover_id' => '1',
                'name' => 'Nuclear generator',
                'current_level' => 3
            ]);
    }

    public function insertRover()
    {
        DB::table('rover')->insert([
            [
                'id' => 5,
                'mission_id' => 2,
                'name' => 'Curiosity',
                'state' => 'LANDED',
                'width' => '2.3m',
                'height' => '1.5m',
                'length' => '1.6m',
                'wheel_count' => 6
            ]
        ]);
    }

    public function deleteRover()
    {
        $this->delete('rover',
            [
                'id' => 1
            ]);
    }
}
