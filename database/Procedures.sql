--Get the no of Cameras when Rover ID and Camera type is given--
CREATE OR REPLACE PROCEDURE noOfCameras(cameraType IN varchar2, rover_id IN varchar2, no OUT number)
IS
  BEGIN
    SELECT COUNT(CAMERA.ID) INTO no
    FROM CAMERA,CAMERATYPE
    WHERE CAMERA.CAMERA_TYPE_ID = CAMERATYPE.ID and CAMERA.ROVER_ID = rover_id and CAMERATYPE.TYPE = cameraType;
    dbms_output.put_line('number of cameras '||no);
  END;
/