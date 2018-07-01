CREATE TABLE Rover (
  id NUMBER(4),
  mission_id NUMBER(4),
  name VARCHAR2(50),
  width VARCHAR2(50),
  height VARCHAR2(50),
  length VARCHAR2(50),
  wheel_count NUMBER(4),
  constraint ROVER_PK PRIMARY KEY (id)
)
/
CREATE sequence ROVER_SEQ
/
CREATE trigger BI_ROVER
  before insert on Rover
  for each row
  begin
    select ROVER_SEQ.nextval into :NEW.id from dual;
  end;
/


CREATE TABLE Mission (
  id NUMBER(4),
  spacecraft_id NUMBER(4),
  name VARCHAR2(50),
  planet VARCHAR2(50),
  year DATE,
  constraint MISSION_PK PRIMARY KEY (id)
)
/
CREATE sequence MISSION_SEQ
/
CREATE trigger BI_MISSION
  before insert on Mission
  for each row
  begin
    select MISSION_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Objectives (
  id NUMBER(4),
  mission_id NUMBER(4),
  name VARCHAR2(50),
  type VARCHAR2(50),
  description VARCHAR2(50),
  constraint OBJECTIVES_PK PRIMARY KEY (id)
)
/
CREATE sequence OBJECTIVES_SEQ
/
CREATE trigger BI_OBJECTIVES
  before insert on Objectives
  for each row
  begin
    select OBJECTIVES_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE PowerSource (
  id NUMBER(4),
  rower_id NUMBER(4),
  name VARCHAR2(50),
  constraint POWERSOURCE_PK PRIMARY KEY (id)
)
/
CREATE sequence POWERSOURCE_SEQ
/
CREATE trigger BI_POWERSOURCE
  before insert on PowerSource
  for each row
  begin
    select POWERSOURCE_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Computer (
  id NUMBER(4),
  rower_id NUMBER(4),
  eeprom VARCHAR2(50),
  dram VARCHAR2(50),
  flash VARCHAR2(50),
  constraint COMPUTER_PK PRIMARY KEY (id)
)
/
CREATE sequence COMPUTER_SEQ
/
CREATE trigger BI_COMPUTER
  before insert on Computer
  for each row
  begin
    select COMPUTER_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Coordinates (
  id NUMBER(4),
  computer_id NUMBER(4),
  data VARCHAR2(50),
  constraint COORDINATES_PK PRIMARY KEY (id)
)
/
CREATE sequence COORDINATES_SEQ
/
CREATE trigger BI_COORDINATES
  before insert on Coordinates
  for each row
  begin
    select COORDINATES_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Images (
  id NUMBER(4),
  camera_id NUMBER(4),
  storage_id NUMBER(4),
  significance FLOAT,
  resolution VARCHAR2(50),
  constraint IMAGES_PK PRIMARY KEY (id)
)
/
CREATE sequence IMAGES_SEQ
/
CREATE trigger BI_IMAGES
  before insert on Images
  for each row
  begin
    select IMAGES_SEQ.nextval into :NEW.id from dual;
  end;
/


CREATE TABLE Copy (
  id NUMBER(4),
  computer_id NUMBER(4),
  coordinate_id NUMBER(4),
  constraint COPY_PK PRIMARY KEY (id)
)
/
CREATE sequence COPY_SEQ
/
CREATE trigger BI_COPY
  before insert on Copy
  for each row
  begin
    select COPY_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Radiation (
  id NUMBER(4),
  coordinate_id NUMBER(4),
  radLevel VARCHAR2(50),
  type VARCHAR2(50),
  constraint RADIATION_PK PRIMARY KEY (id)
)
/
CREATE sequence RADIATION_SEQ
/
CREATE trigger BI_RADIATION
  before insert on Radiation
  for each row
  begin
    select RADIATION_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Surface (
  id NUMBER(4),
  radiation_id NUMBER(4),
  landingSite VARCHAR2(50),
  constraint SURFACE_PK PRIMARY KEY (id)
)
/
CREATE sequence SURFACE_SEQ
/
CREATE trigger BI_SURFACE
  before insert on Surface
  for each row
  begin
    select SURFACE_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Interior (
  id NUMBER(4),
  radiation_id NUMBER(4),
  distance FLOAT,
  constraint INTERIOR_PK PRIMARY KEY (id)
)
/
CREATE sequence INTERIOR_SEQ
/
CREATE trigger BI_INTERIOR
  before insert on Interior
  for each row
  begin
    select INTERIOR_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Storage (
  id NUMBER(4),
  type VARCHAR2(50),
  capacity VARCHAR2(50),
  constraint STORAGE_PK PRIMARY KEY (id)
)
/
CREATE sequence STORAGE_SEQ
/
CREATE trigger BI_STORAGE
  before insert on Storage
  for each row
  begin
    select STORAGE_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Camera (
  id NUMBER(4),
  rover_id NUMBER(4),
  isMainCam SMALLINT,
  name VARCHAR2(50),
  focal_length VARCHAR2(50),
  field_of_view VARCHAR2(50),
  resolution VARCHAR2(50),
  constraint CAMERA_PK PRIMARY KEY (id)
)
/
CREATE sequence CAMERA_SEQ
/
CREATE trigger BI_CAMERA
  before insert on Camera
  for each row
  begin
    select CAMERA_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Haz (
  id NUMBER(4),
  camera_id NUMBER(4),
  name VARCHAR2(50),
  constraint HAZ_PK PRIMARY KEY (id)
)
/
CREATE sequence HAZ_SEQ
/
CREATE trigger BI_HAZ
  before insert on Haz
  for each row
  begin
    select HAZ_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Nav (
  id NUMBER(4),
  camera_id NUMBER(4),
  name VARCHAR2(50),
  constraint NAV_PK PRIMARY KEY (id)
)
/
CREATE sequence NAV_SEQ
/
CREATE trigger BI_NAV
  before insert on Nav
  for each row
  begin
    select NAV_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Pancam (
  id NUMBER(4),
  camera_id NUMBER(4),
  constraint PANCAM_PK PRIMARY KEY (id)
)
/
CREATE sequence PANCAM_SEQ
/
CREATE trigger BI_PANCAM
  before insert on Pancam
  for each row
  begin
    select PANCAM_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Mast (
  id NUMBER(4),
  camera_id NUMBER(4),
  name VARCHAR2(50),
  sub_camera VARCHAR2(50),
  constraint MAST_PK PRIMARY KEY (id)
)
/
CREATE sequence MAST_SEQ
/
CREATE trigger BI_MAST
  before insert on Mast
  for each row
  begin
    select MAST_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Mahli (
  id NUMBER(4),
  camera_id NUMBER(4),
  constraint MAHLI_PK PRIMARY KEY (id)
)
/
CREATE sequence MAHLI_SEQ
/
CREATE trigger BI_MAHLI
  before insert on Mahli
  for each row
  begin
    select MAHLI_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE ChemCam (
  id NUMBER(4),
  camera_id NUMBER(4),
  constraint CHEMCAM_PK PRIMARY KEY (id)
)
/
CREATE sequence CHEMCAM_SEQ
/
CREATE trigger BI_CHEMCAM
  before insert on ChemCam
  for each row
  begin
    select CHEMCAM_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Mardi (
  id NUMBER(4),
  camera_id NUMBER(4),
  name VARCHAR2(50),
  constraint MARDI_PK PRIMARY KEY (id)
)
/
CREATE sequence MARDI_SEQ
/
CREATE trigger BI_MARDI
  before insert on Mardi
  for each row
  begin
    select MARDI_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Instrument (
  id NUMBER(4),
  chemcam_id NUMBER(4),
  name VARCHAR2(50),
  purpose VARCHAR2(50),
  constraint INSTRUMENT_PK PRIMARY KEY (id)
)
/
CREATE sequence INSTRUMENT_SEQ
/
CREATE trigger BI_INSTRUMENT
  before insert on Instrument
  for each row
  begin
    select INSTRUMENT_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Sensor (
  id NUMBER(4),
  rover_id NUMBER(4),
  name VARCHAR2(50),
  type VARCHAR2(50),
  constraint SENSOR_PK PRIMARY KEY (id)
)
/
CREATE sequence SENSOR_SEQ
/
CREATE trigger BI_SENSOR
  before insert on Sensor
  for each row
  begin
    select SENSOR_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE Mossbauer (
  id NUMBER(4),
  sensor_id NUMBER(4),
  constraint MOSSBAUER_PK PRIMARY KEY (id)
)
/
CREATE sequence MOSSBAUER_SEQ
/
CREATE trigger BI_MOSSBAUER
  before insert on Mossbauer
  for each row
  begin
    select MOSSBAUER_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE MiniTES (
id NUMBER(4),
  sensor_id NUMBER(4),
  nav_id NUMBER(4),
constraint MINI_TES_PK PRIMARY KEY (id)
)
/
CREATE sequence MINI_TES_SEQ
/
CREATE trigger BI_MINI_TES
  before insert on MiniTES
for each row
begin
  select MINI_TES_SEQ.nextval into :NEW.id from dual;
end;
/

CREATE TABLE APXS (
  id NUMBER(4),
  sensor_id NUMBER(4),
  constraint APXS_PK PRIMARY KEY (id)
)
/
CREATE sequence APXS_SEQ
/
CREATE trigger BI_APXS
  before insert on APXS
  for each row
  begin
    select APXS_SEQ.nextval into :NEW.id from dual;
  end;
/

CREATE TABLE SpaceCraft (
  id NUMBER(4),
  name VARCHAR2(50),
  country VARCHAR2(50),
  constraint SPACECRAFT_PK PRIMARY KEY (id)
)
/
CREATE sequence SPACECRAFT_SEQ
/
CREATE trigger BI_SPACECRAFT
  before insert on SpaceCraft
  for each row
  begin
    select SPACECRAFT_SEQ.nextval into :NEW.id from dual;
  end;
/


CREATE TABLE SubSensor (
  id NUMBER(4),
  apxs_id NUMBER(4),
  name VARCHAR2(50),
  constraint SUBSENSORS_PK PRIMARY KEY (id)
)
/
CREATE sequence SUBSENSOR_SEQ
/
CREATE trigger BI_SUBSENSOR
  before insert on SubSensor
  for each row
  begin
    select SUBSENSOR_SEQ.nextval into :NEW.id from dual;
  end;
/


CREATE TABLE Communication (
  id NUMBER(4),
  rover_id NUMBER(4),
  orbiter_id NUMBER(4),
  cmode VARCHAR2(50),
  type VARCHAR2(50),
  band VARCHAR2(50),
  constraint COMMUNICATION_PK PRIMARY KEY (id)
)
/
CREATE sequence COMMUNICATION_SEQ
/
CREATE trigger BI_COMMUNICATION
  before insert on Communication
  for each row
  begin
    select COMMUNICATION_SEQ.nextval into :NEW.id from dual;
  end;
/


CREATE TABLE Orbiter (
  id NUMBER(4),
  cmode VARCHAR2(50),
  type VARCHAR2(50),
  band VARCHAR2(50),
  planet VARCHAR2(50),
  isMalFunctioning SMALLINT,
  constraint ORBITER_PK PRIMARY KEY (id)
)
/
CREATE sequence ORBITER_SEQ
/
CREATE trigger BI_ORBITER
  before insert on Orbiter
  for each row
  begin
    select ORBITER_SEQ.nextval into :NEW.id from dual;
  end;
/


ALTER TABLE Rover ADD CONSTRAINT Rover_fk0 FOREIGN KEY (mission_id) REFERENCES Mission(id) ON DELETE CASCADE;

ALTER TABLE Mission ADD CONSTRAINT Mission_fk0 FOREIGN KEY (spacecraft_id) REFERENCES SpaceCraft(id) ON DELETE CASCADE;

ALTER TABLE Objectives ADD CONSTRAINT Objectives_fk0 FOREIGN KEY (mission_id) REFERENCES Mission(id) ON DELETE CASCADE;


ALTER TABLE PowerSource ADD CONSTRAINT PowerSource_fk0 FOREIGN KEY (rower_id) REFERENCES Rover(id) ON DELETE CASCADE;

ALTER TABLE Computer ADD CONSTRAINT Computer_fk0 FOREIGN KEY (rower_id) REFERENCES Rover(id) ON DELETE CASCADE;

ALTER TABLE Coordinates ADD CONSTRAINT Coordinates_fk0 FOREIGN KEY (computer_id) REFERENCES Computer(id) ON DELETE CASCADE;

ALTER TABLE Images ADD CONSTRAINT Images_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;
ALTER TABLE Images ADD CONSTRAINT Images_fk1 FOREIGN KEY (storage_id) REFERENCES Storage(id) ON DELETE CASCADE;

ALTER TABLE Copy ADD CONSTRAINT Copy_fk0 FOREIGN KEY (computer_id) REFERENCES Computer(id) ON DELETE CASCADE;
ALTER TABLE Copy ADD CONSTRAINT Copy_fk1 FOREIGN KEY (coordinate_id) REFERENCES Coordinates(id) ON DELETE CASCADE;

ALTER TABLE Radiation ADD CONSTRAINT Radiation_fk0 FOREIGN KEY (coordinate_id) REFERENCES Coordinates(id) ON DELETE CASCADE;

ALTER TABLE Surface ADD CONSTRAINT Surface_fk0 FOREIGN KEY (radiation_id) REFERENCES Radiation(id) ON DELETE CASCADE;

ALTER TABLE Interior ADD CONSTRAINT Interior_fk0 FOREIGN KEY (radiation_id) REFERENCES Radiation(id) ON DELETE CASCADE;


ALTER TABLE Camera ADD CONSTRAINT Camera_fk0 FOREIGN KEY (rover_id) REFERENCES Rover(id) ON DELETE CASCADE;

ALTER TABLE Haz ADD CONSTRAINT Haz_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;

ALTER TABLE Nav ADD CONSTRAINT Nav_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;

ALTER TABLE Pancam ADD CONSTRAINT Pancam_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;

ALTER TABLE Mast ADD CONSTRAINT Mast_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;

ALTER TABLE Mahli ADD CONSTRAINT Mahli_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;

ALTER TABLE ChemCam ADD CONSTRAINT ChemCam_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;

ALTER TABLE Mardi ADD CONSTRAINT Mardi_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;

ALTER TABLE Instrument ADD CONSTRAINT Instrument_fk0 FOREIGN KEY (chemcam_id) REFERENCES ChemCam(id) ON DELETE CASCADE;

ALTER TABLE Sensor ADD CONSTRAINT Sensor_fk0 FOREIGN KEY (rover_id) REFERENCES Rover(id) ON DELETE CASCADE;

ALTER TABLE Mossbauer ADD CONSTRAINT Mossbauer_fk0 FOREIGN KEY (sensor_id) REFERENCES Sensor(id) ON DELETE CASCADE;

ALTER TABLE MiniTES ADD CONSTRAINT MiniTES_fk0 FOREIGN KEY (sensor_id) REFERENCES Sensor(id) ON DELETE CASCADE;
ALTER TABLE MiniTES ADD CONSTRAINT MiniTES_fk1 FOREIGN KEY (nav_id) REFERENCES Nav(id) ON DELETE CASCADE;

ALTER TABLE APXS ADD CONSTRAINT APXS_fk0 FOREIGN KEY (sensor_id) REFERENCES Sensor(id) ON DELETE CASCADE;

ALTER TABLE SubSensor ADD CONSTRAINT SubSensors_fk0 FOREIGN KEY (apxs_id) REFERENCES APXS(id) ON DELETE CASCADE;

ALTER TABLE Communication ADD CONSTRAINT Communication_fk0 FOREIGN KEY (rover_id) REFERENCES Rover(id) ON DELETE CASCADE;
ALTER TABLE Communication ADD CONSTRAINT Communication_fk1 FOREIGN KEY (orbiter_id) REFERENCES Orbiter(id) ON DELETE CASCADE;
