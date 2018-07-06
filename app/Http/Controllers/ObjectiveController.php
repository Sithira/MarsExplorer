<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;

class ObjectiveController extends Controller
{
    public function index($roverId)
    {

        $sql = "SELECT OBJ.* FROM OBJECTIVES OBJ 
                          JOIN MISSION M on OBJ.MISSION_ID = M.ID
                          JOIN ROVER R on M.ID = R.MISSION_ID 
                  WHERE R.ID = $roverId";

        $objectives = DB::select($sql);

    }

    /**
     * Create a new objective for a rover
     *
     * @param $roverId
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View
     */
    public function create($roverId)
    {

        // select the rover
        $rover = DB::selectOne("SELECT * FROM ROVER WHERE ID = $roverId");

        $mission = DB::selectOne("SELECT * FROM MISSION WHERE ID = " . $rover->mission_id);

        // if we have a rover
        if (!empty($rover))
        {
            return view('system.objective.create', compact('rover', 'mission'));
        }
        else
        {
            flash()->error("Rover is not available");

            return redirect()->back();
        }
    }

    /**
     * Make the Objective for the rover.
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {

        // get the rover id
        $roverId = $request->rover_id;

        // select the rover
        $rover = DB::selectOne("SELECT * FROM ROVER WHERE ID = $roverId");

        // get the mission
        $missionId = $rover->mission_id;

        // if we have a rover
        if (!empty($rover))
        {

            // get the name
            $name = $request->name;

            // get the type
            $type = $request->type;

            // get the description
            $description = $request->description;

            // make the insert query
            $insertSQL = "INSERT INTO OBJECTIVES (MISSION_ID, NAME, TYPE, DESCRIPTION) VALUES ('$missionId', '$name', '$type', '$description')";

            // insert to the database
            DB::insert($insertSQL);

            // let the user that the insert was a success
            flash()->success("Objective added to rover successfully");

            // return the user back, to where he came from.
            return redirect()->back();
        }
        else
        {
            flash()->error("Rover is not available");

            return redirect()->back();
        }

    }

    public function edit($roverId, $objectiveId)
    {
        $objective = DB::selectOne("SELECT * FROM OBJECTIVES WHERE ID = $objectiveId");

        return view('system.objective.edit', compact('objective', 'roverId'));
    }

    public function update(Request $request, $roverId, $objectiveId)
    {

        $objective = DB::selectOne("SELECT * FROM OBJECTIVES WHERE ID = $objectiveId");

        if (!empty($objective))
        {
            $name = $request->name;

            $type = $request->type;

            $description = $request->description;

            $sql = "UPDATE OBJECTIVES SET NAME = '$name', TYPE = '$type', DESCRIPTION = '$description' WHERE ID = $objectiveId";

            DB::update($sql);

            flash()->success("Objective updated successfully");

            return redirect()->back();
        }
        else
        {
            flash()->error("Rover is not available");

            return redirect()->back();
        }

    }
}
