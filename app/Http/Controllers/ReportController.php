<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use PDF;

class ReportController extends Controller
{

    public function index()
    {
        $rovers = DB::select("SELECT * FROM ROVER");

        return view('system.reports.index', compact('rovers'));
    }

    public function getReportForRover($roverId)
    {
        // search for rover
        $rover = DB::selectOne("SELECT * FROM ROVER WHERE ID = $roverId");

        if (!empty($rover))
        {
            // Normal and Joined SQL Queries
            $cameras = DB::select("SELECT * FROM CAMERA WHERE ROVER_ID = $roverId");

            $orbitersAndCommunications = DB::select("SELECT * FROM COMMUNICATION COM JOIN ORBITER O on COM.ORBITER_ID = O.ID WHERE COM.ROVER_ID = $roverId");

            $computersAndCoordinates = DB::select("SELECT * FROM COMPUTER C JOIN COORDINATES C2 on C.ID = C2.COMPUTER_ID WHERE C.ROVER_ID = $roverId");

            // Call the PL/SQL Functions
            $sensorsAndTypes = DB::select("SELECT GET_SENSORS($roverId) FROM dual");

            $volume = DB::selectOne("SELECT TOTAL_VOLUME($roverId) AS VOLUME_TOT FROM dual");

            $orbiterList = DB::select("SELECT GET_ORBITERS($roverId) AS ORBS FROM dual");

            $images = DB::select("SELECT CORD.DATA as coordinates, IMG.* FROM IMAGES IMG JOIN COORDINATES CORD ON IMG.ID = CORD.IMAGE_ID WHERE CAMERA_ID IN (SELECT ID FROM CAMERA WHERE ROVER_ID = $roverId)");

            $communicationAndComputer = DB::selectOne("SELECT GET_COORDINATES($roverId) AS CORDS FROM dual");

            $pdf = PDF::loadView('system.reports.report', compact('rover', 'cameras', 'orbitersAndCommunications', 'computersAndCoordinates', 'sensorsAndTypes', 'volume', 'orbiterList', 'communicationAndComputer', 'images'));

            return $pdf->stream("rover.pdf");
        }
    }
}
