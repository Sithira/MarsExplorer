<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CameraSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('camera')->insert([
            [
                'id' => 1,
                'rover_id' => 1,
                'camera_type_id' => 1,
                'isMainCam' => 0,
                'name' => 'HazCam',
                'focal_length' => '23mm',
                'field_of_view' => '120°',
                'resolution' => '1600 x 1200'
            ],
            [
                'id' => 11,
                'rover_id' => 1,
                'camera_type_id' => 6,
                'isMainCam' => 0,
                'name' => 'ChemCam',
                'focal_length' => '25mm',
                'field_of_view' => '40.3°',
                'resolution' => '3840 x 2160'
            ],
            [
                'id' => 12,
                'rover_id' => 1,
                'camera_type_id' => 7,
                'isMainCam' => 0,
                'name' => 'PanCam',
                'focal_length' => '38mm',
                'field_of_view' => '45°',
                'resolution' => '4000 x 24000'
            ],
            [
                'id' => 2,
                'rover_id' => 1 ,
                'camera_type_id' => 2,
                'isMainCam' => 1,
                'name' => 'NavCam',
                'focal_length' => '50mm',
                'field_of_view' => '45°',
                'resolution' => '3840 x 2160'
            ],
            [
                'id' => 1,
                'rover_id' => 2,
                'camera_type_id' => 1,
                'name' => 'HazCam',
                'isMainCam' => 0,
                'focal_length' => '32mm',
                'field_of_view' => '60°',
                'resolution' => '1600 x 1200'
            ],

            [
                'id' => 4,
                'rover_id' => 3,
                'camera_type_id' => 2,
                'isMainCam' => 1,
                'name' => 'NavCam',
                'focal_length' => '34mm',
                'field_of_view' => '40°',
                'resolution' => '3840 x 2160'
            ],
            [
                'id' => 5,
                'rover_id' => 3,
                'camera_type_id' => 3,
                'isMainCam' => 0,
                'name' => 'MastCam 1',
                'focal_length' => '34mm',
                'field_of_view' => '15°',
                'resolution' => '1280 x 720'
            ],
            [
                'id' => 9,
                'rover_id' => 3,
                'camera_type_id' => 5,
                'isMainCam' => 0,
                'name' => 'MARDI',
                'focal_length' => '30mm',
                'field_of_view' => '35.8°',
                'resolution' => '4096 x 2160'
            ],
            [
                'id' => 6,
                'rover_id' => 4 ,
                'camera_type_id' => 3,
                'isMainCam' => 0,
                'name' => 'MastCam 2',
                'focal_length' => '100mm',
                'field_of_view' => '5.1°',
                'resolution' => '7280 x 4320'
            ],
            [
                'id' => 7,
                'rover_id' => 4 ,
                'camera_type_id' => 4,
                'isMainCam' => 0,
                'name' => 'MAHLI',
                'focal_length' => '21.3mm',
                'field_of_view' => '38.5°',
                'resolution' => '1600 x 1200'
            ],
            [
                'id' => 8,
                'rover_id' => 4 ,
                'camera_type_id' => 4,
                'isMainCam' => 0,
                'name' => 'MARDI',
                'focal_length' => '28mm',
                'field_of_view' => '35°',
                'resolution' => '4096 x 2160'
            ],
            [
                'id' => 10,
                'rover_id' => 4,
                'camera_type_id' => 6,
                'isMainCam' => 0,
                'name' => 'ChemCam',
                'focal_length' => '25mm',
                'field_of_view' => '40.3°',
                'resolution' => '3840 x 2160'
            ],
            [
                'id' => 3,
                'rover_id' => 4 ,
                'camera_type_id' => 2,
                'isMainCam' => 1,
                'name' => 'NavCam',
                'focal_length' => '50mm',
                'field_of_view' => '45°',
                'resolution' => '3840 x 2160'
            ]
        ]);
    }
}
