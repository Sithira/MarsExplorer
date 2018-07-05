<?php

namespace App\Http\Controllers;

use App\Models\Rover;
use DB;
use Illuminate\Http\Request;

class RoverController extends Controller
{

    /**
     * Get all the rowers in the database
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {

        // select every rover
        $query = 'SELECT * FROM "ROVER"';

        $roverTypes = 'SELECT * FROM "ROVER" WHERE ID IN (SELECT  MAX(id) FROM "ROVER" GROUP BY name)';

        $roverTypes = DB::select($roverTypes);

        // execute the query to the database
        $rovers = DB::select($query);

        // return the data to the view
        return view('system.rovers.index', compact('rovers', 'roverTypes'));
    }

    public function show($id)
    {

        // search for rover
        $rover = DB::selectOne("SELECT * FROM ROVER WHERE ID = $id");

        if (!empty($rover)) {


            // Normal and Joined SQL Queries
            $cameras = DB::select("SELECT * FROM CAMERA WHERE ROVER_ID = $id");

            $orbitersAndCommunications = DB::select("SELECT * FROM COMMUNICATION COM JOIN ORBITER O on COM.ORBITER_ID = O.ID WHERE COM.ROVER_ID = $id");

            $computersAndCoordinates = DB::select("SELECT * FROM COMPUTER C JOIN COORDINATES C2 on C.ID = C2.COMPUTER_ID WHERE C.ROVER_ID = $id");

            // Call the PL/SQL Functions
            $sensorsAndTypes = DB::select("SELECT GET_SENSORS($id) FROM dual");

            $volume = DB::selectOne("SELECT TOTAL_VOLUME($id) AS VOLUME_TOT FROM dual");

            $orbiterList = DB::selectOne("SELECT GET_ORBITERS($id) AS ORBS FROM dual");

            $communicationAndComputer = DB::selectOne("SELECT GET_COORDINATES($id) AS CORDS FROM dual");

            return view('system.rovers.show', compact('rover',
                'cameras',
                'orbitersAndCommunications',
                'computersAndCoordinates', 'sensorsAndTypes', 'volume', 'orbiterList', 'communicationAndComputer'));
        }
        else
        {
            flash()->error("Rover with a ID: ${$id} is not found. Please check.");

            return redirect()->back();
        }

    }
}
