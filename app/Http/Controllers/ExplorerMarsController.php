<?php

namespace App\Http\Controllers;

use DB;
use Image;

class ExplorerMarsController extends Controller
{

    /**
     * Explore the mars using the given user.
     *
     * @param $roverId
     * @return \Illuminate\Http\RedirectResponse
     */
    public function explore($roverId)
    {

        // select the rover from the database
        $rover = DB::select("SELECT * FROM ROVER WHERE ID = $roverId");

        // only if a rover is available
        if (!empty($rover))
        {

            // get a computer from the rover.
            $computer = DB::select("SELECT * FROM COMPUTER WHERE ROVER_ID = $roverId");

            $cameras = DB::select("SELECT * FROM CAMERA WHERE ROVER_ID = $roverId")[0]->id;

            // dynamically select the computer
            $computer = $computer[0]->id;

            // dynamic get a number of loops times
            $loopTimes = rand(10, 50);

            // loop for the random number of times
            for ($int = 0; $int < $loopTimes; $int++)
            {

                // get the sample image from the path and encode it
                $imageData = Image::make(public_path("assets/img/icon-images/rover-mars.jpg"))
                    ->encode('data-url');

                // create an entry for the new image in the database
                $newImage = DB::connection('oracle')->table('images')->insertGetId([
                    'camera_id' => $cameras,
                    'storage_id' => 1,
                    'data' => $imageData,
                    'significance' => rand(1, 100),
                    'resolution' => '1080 x 920'
                ]);

                // generate lats
                $lats = 0 + lcg_value()*(abs(10 - 0));

                // generate longs
                $lngs = 0 + lcg_value()*(abs(10 - 0));

                // merge lats and longs
                $data = $lats . '° N  ' . $lngs . '° E';

                // create the new coordinates
                DB::connection('oracle')->table('coordinates')->insertGetId(
                    array('computer_id' => $computer, 'image_id' => $newImage, 'data' => $data)
                );

            }

            // let the user that the rover has successfully explored mars
            flash()->success("Mars Successfully Explored !");

            // redirect the user
            return redirect()->back();


        }
        else
        {
            flash()->error("Mars couldn't be explored right now");

            return redirect()->back();
        }

    }

}
