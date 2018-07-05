<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        // get the rover count from the database
        $roverCount = DB::select("SELECT COUNT(ID) AS ROVER_COUNT FROM ROVER")[0]->rover_count;

        // get the mission count from the database
        $missionCount =  DB::select("SELECT COUNT(ID) AS MISSION_COUNT FROM MISSION")[0]->mission_count;

        // get the image count from the database
        $imagesCount = DB::select("SELECT COUNT(ID) AS IMAGE_COUNT FROM IMAGES")[0]->image_count;

        // get the objectives from the database
        $objectiveCount = DB::select("SELECT COUNT(ID) AS OBJECTIVE_COUNT FROM OBJECTIVES")[0]->objective_count;

        $cameraCount = DB::select("SELECT COUNT(ID) AS CAMERA_COUNT FROM CAMERA")[0]->camera_count;

        $orbiterCount = DB::select("SELECT COUNT(ID) AS ORB_COUNT FROM ORBITER")[0]->orb_count;

        $coordinatesCount = DB::select("SELECT COUNT(ID) AS CORD_COUNT FROM COORDINATES")[0]->cord_count;

        $sensorCount = DB::select("SELECT COUNT(ID) AS SEN_COUNT FROM SENSOR")[0]->sen_count;

        return view('home', compact(
            'roverCount',
            'missionCount',
            'imagesCount',
            'objectiveCount',
            'cameraCount',
            'orbiterCount',
            'coordinatesCount',
            'sensorCount'));
    }
}
