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