-- Setting Radiations on state when rover is Travelling --
CREATE OR REPLACE TRIGGER POPULATE_RADIATION
  AFTER UPDATE
  ON ROVER
  FOR EACH ROW

  -- Declare the required variables
  DECLARE
    number_of_loops pls_integer;
    last_computer   pls_integer;
    last_coordinate pls_integer;
    lat             pls_integer;
    lang            pls_integer;
    rad_level       varchar(100);
    lat_lng         varchar2(200);

  BEGIN

    -- if the ROVER State is DEPLOYED
    IF (:NEW.STATE = 'DEPLOYED')
    THEN
      -- Generate a random value between, 0.01 and  999
      SELECT trunc(dbms_random.value(0.01, 999.9), 2)
      INTO lat
      FROM dual;

      -- Get lang
      SELECT trunc(dbms_random.value(0.01, 999.9), 2)
      INTO lang
      FROM dual;

      -- Get a random number between 1 and 10 for number of loops
      SELECT dbms_random.value(1, 10) num
      into number_of_loops
      FROM dual;

      -- concatenate the strings to build coordinates
      lat_lng := concat(concat(TO_CHAR(lat, '999.99'), ','), TO_CHAR(lang, '999.99'));

      -- Get the last computer for the changed state rover
      SELECT COMPUTER.ID
      INTO last_computer -- and assign to last_computer variable
      FROM COMPUTER
      WHERE COMPUTER.ROVER_ID = :OLD.ID
            AND
            ROWNUM = 1
      ORDER BY COMPUTER.ID DESC;

      -- Create new Coordination
      INSERT INTO
        COORDINATES (COMPUTER_ID, DATA)
      VALUES
        (last_computer, lat_lng);

      -- Get the last coordinate of the last computer
      SELECT COORDINATES.ID
      INTO last_coordinate
      FROM COORDINATES
      WHERE COORDINATES.COMPUTER_ID = last_computer
            AND
            ROWNUM = 1
      ORDER BY COORDINATES.ID DESC;

      -- loop for the radiations
      FOR cnt IN 1..number_of_loops
      LOOP

        -- Get a random rad level
        SELECT dbms_random.value(1, 500) num
        into rad_level
        FROM dual;

        rad_level := concat(trunc(rad_level, '500.99'), 'mrad/d');

        -- Create the radiation
        INSERT INTO RADIATION (COORDINATE_ID, RADLEVEL, TYPE)
        VALUES (last_coordinate, rad_level, 'X');
      END LOOP;

    END IF;

  END;
/


-- Duplicate the COORDINATES WHEN INSERTING OR UPDATING THE COORDINATES TABLE
CREATE OR REPLACE TRIGGER CREATE_COORDINATES_COPY
  AFTER INSERT OR UPDATE ON COORDINATES
  FOR EACH ROW

  BEGIN
    INSERT INTO COORDINATECOPY(COMPUTER_ID, DATA) VALUES (:NEW.COMPUTER_ID, :NEW.DATA);
  END;
/


-- Change Significance --
CREATE OR REPLACE TRIGGER CHANGE_SIGNIFICANCE
  BEFORE INSERT
  ON IMAGES
  FOR EACH ROW

  BEGIN
    IF :NEW.SIGNIFICANCE > 70
    THEN
      :NEW.STORAGE_ID := 1;
    ELSIF :NEW.SIGNIFICANCE >= 45 OR :NEW.SIGNIFICANCE <= 69
      THEN
        :NEW.STORAGE_ID := 2;
    ELSE
      :NEW.STORAGE_ID := 3;
    END IF;
  END;
/


-- Change the state of the Rover --
CREATE OR REPLACE TRIGGER ROVER_STATE_ONNULL
  BEFORE INSERT ON ROVER
  FOR EACH ROW
  BEGIN
    IF :NEW.STATE IS NULL THEN
      :NEW.STATE:='READY';
    END IF;
  END;
/


-- Change power level of the rover when Rover explore new Coordinate --
CREATE OR REPLACE TRIGGER CHANGE_POWER_LEVEL
  AFTER INSERT ON COORDINATES FOR EACH ROW

  DECLARE
    new_level number;
    powersource_id number;
  BEGIN
    new_level := dbms_random.value(1,100);
    GET_POWERSOURCE_ID(:new.ID, powersource_id);
    UPDATE POWERSOURCE
      SET CURRENT_LEVEL = ROUND(new_level)
      WHERE ID = powersource_id;
  END;
/