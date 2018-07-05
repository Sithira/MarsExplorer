--Get the no of Cameras when Rover ID and Camera type is given--
CREATE OR REPLACE PROCEDURE NO_OF_CAMERAS(cameraType IN varchar2, rover_id IN varchar2, no OUT number)
IS
  BEGIN
    SELECT COUNT(CAMERA.ID)
    INTO no
    FROM CAMERA, CAMERATYPE
    WHERE CAMERA.CAMERA_TYPE_ID = CAMERATYPE.ID and CAMERA.ROVER_ID = rover_id and CAMERATYPE.TYPE = cameraType;
    dbms_output.put_line('number of cameras ' || no);
  END;
/

-- Get the number of malfunctioning orbiters for a given rover
CREATE OR REPLACE PROCEDURE NO_OF_MALFUNCTIONING_ORBITERS(ROVERID IN NUMBER, NUM OUT NUMBER)
IS
  BEGIN
    SELECT COUNT(ID)
    INTO NUM
    FROM ORBITER
    WHERE ID IN (SELECT ID -- get the orbiters using the communicators that the selected rover is using.
                 FROM COMMUNICATION
                 WHERE ROVER_ID = ROVERID)
          AND ISMALFUNCTIONING = 1; -- get only the malfunction orbiters
  END;
  /

-- Make a random orbiter malfunction
CREATE OR REPLACE PROCEDURE MAKE_ORBITER_MALFUNCTIONING
IS

  -- init the variables
  orb_count      NUMBER;

  rand_selection NUMBER;

  -- make the data type to hold all the orbiters into one place
  TYPE ORBITERS_ARRAY IS TABLE OF ORBITER%ROWTYPE INDEX BY PLS_INTEGER;

  -- create the variable with created variable type
  orb_array      ORBITERS_ARRAY;

  BEGIN

    -- Select all orbiters into the array
    SELECT *
    BULK COLLECT INTO orb_array
    FROM ORBITER
    WHERE ISMALFUNCTIONING = 0;

    -- get the count of the array
    orb_count := orb_array.COUNT;

    -- select a random value between 1 and the orb count
    SELECT round(dbms_random.value(1, orb_count)) output
    INTO rand_selection
    FROM dual;

    -- update the randomly selected orbiter ( make malfunctioning )
    UPDATE ORBITER SET ISMALFUNCTIONING = 1 WHERE ID = orb_array(rand_selection).ID;

  END;
/

-- Dynamically set the main camera of the given rover.
CREATE OR REPLACE PROCEDURE SET_MAIN_CAM_RANDOM(ROVERID IN NUMBER)

  -- declare the required variables
IS
  ROV          ROVER%ROWTYPE;
  UPDATING_CAM CAMERA%ROWTYPE;
  rand_num     NUMBER;
  array_size   NUMBER;

  -- declare the custom data type
  TYPE ROV_CAMS_ARRAY IS TABLE OF CAMERA%ROWTYPE INDEX BY PLS_INTEGER;

  -- declare it's variable
  ROV_CAMS     ROV_CAMS_ARRAY;

  BEGIN

    -- get all the camera's that belongs to the given rover
    SELECT *
    BULK COLLECT INTO ROV_CAMS
    FROM CAMERA
    WHERE ROVER_ID = ROVERID;

    -- Get the array size of the camera's array
    array_size := ROV_CAMS.COUNT;

    -- get an random number
    SELECT round(dbms_random.value(1, array_size)) output
    into rand_num
    FROM dual;

    -- update a random row
    UPDATE CAMERA
    SET ISMAINCAM = 1
    WHERE ID = ROV_CAMS(rand_num).ID;
  END;
/