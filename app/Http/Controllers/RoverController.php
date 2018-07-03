<?php

namespace App\Http\Controllers;

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
}
