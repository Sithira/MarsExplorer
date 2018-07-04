--Get Total volume of a Rover by passing Rover ID--
create FUNCTION TOTAL_VOLUME(rover_id number)
  RETURN float IS
  volume float;
  height number;
  length number;
  width number;
  r_height varchar2(10);
  r_length varchar2(10);
  r_width varchar2(10);

  BEGIN
    SELECT HEIGHT, LENGTH, WIDTH into r_height, r_length, r_width
    FROM ROVER
    WHERE id = rover_id;
    r_height := replace(r_height,'m');
    height := to_number(r_height);
    dbms_output.put_line(height);

    r_length := replace(r_length,'m');
    length := to_number(r_length);
    dbms_output.put_line(length);

    r_width := replace(r_width,'m');
    width := to_number(r_width);
    dbms_output.put_line(width);

    volume:= height*length*width;
    RETURN volume;
  END;
/



--check whether the communication is direct or indirect--
create FUNCTION IS_DIRECT_COMMUNICATION(communication_id number)
  RETURN boolean IS
  com_orbiter_id number;

  BEGIN
    SELECT ORBITER_ID into com_orbiter_id
    FROM COMMUNICATION
    WHERE id = communication_id;

    if com_orbiter_id is null
      then
        dbms_output.put_line('orbiter id null');
        RETURN true;
      else
        dbms_output.put_line('orbiter id not null');
        RETURN false;
    end if;
  END;
/

-- Change Significance
CREATE OR REPLACE TRIGGER CHANGE_SIGNIFICANCE
  BEFORE INSERT ON IMAGES FOR EACH ROW

  BEGIN
    IF :NEW.SIGNIFICANCE > 70 THEN
      :NEW.STORAGE_ID := 1;
    ELSIF :NEW.SIGNIFICANCE >= 45 OR :NEW.SIGNIFICANCE <= 69 THEN
      :NEW.STORAGE_ID := 2;
    ELSE
      :NEW.STORAGE_ID := 3;
    END IF;
  END;
/

-- Get all Orbiter that a given Rover communicates with.
CREATE OR REPLACE FUNCTION GET_ORBITERS(ROVERID in NUMBER)

  -- define that the function will return a cursor
  RETURN SYS_REFCURSOR

  -- set the variable to output the rows
AS output SYS_REFCURSOR;

  BEGIN
    OPEN output
    FOR SELECT * -- return every row to the output, so that the output can be returned
        FROM ORBITER
        WHERE ID IN (SELECT ID
                     FROM COMMUNICATION
                     WHERE ROVER_ID = ROVERID);

    -- return the output
    RETURN output;
  END;

-- Get the All sensors of a Rover when a rover id is given
CREATE OR REPLACE FUNCTION GET_SENSORS(ROVERID IN NUMBER)

  RETURN SYS_REFCURSOR

AS output SYS_REFCURSOR;

  BEGIN

    OPEN output
    FOR SELECT *
        FROM SENSOR
        WHERE SENSOR.ROVER_ID = ROVERID;
    RETURN output;

  END;

-- Get all the Sensors that belongs to a certain type
CREATE OR REPLACE FUNCTION GET_SENSORS_WITH_TYPE(ROVERID IN NUMBER, SENSORTYPE IN VARCHAR)

  RETURN SYS_REFCURSOR

AS output SYS_REFCURSOR;

  BEGIN

    OPEN output
    FOR SELECT *
        FROM SENSOR
        WHERE ROVER_ID = ROVERID AND SENSOR_TYPE_ID = (SELECT ID
                                                       FROM SENSORTYPE
                                                       WHERE NAME = SENSORTYPE);
    RETURN output;

  END;

-- Get the coordinates of a ROVER
CREATE OR REPLACE FUNCTION GET_COORDINATES(ROVERID IN NUMBER)

  RETURN SYS_REFCURSOR

AS output SYS_REFCURSOR;

  BEGIN

    OPEN output
    FOR SELECT *
        FROM COORDINATES
        WHERE COMPUTER_ID IN (SELECT ID
                              FROM COMPUTER
                              WHERE ROVER_ID = ROVERID);

  END;