--Get Total volume of a Rover by passing Rover ID--
create FUNCTION totalVolume(rover_id number)
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
create FUNCTION isDirectCommunication(communication_id number)
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
