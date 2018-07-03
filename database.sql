-- Rover Table --
CREATE TABLE Rover (
  id NUMBER(4),
  mission_id NUMBER(4),
  name VARCHAR2(50),
  state VARCHAR2(10),
  width VARCHAR2(50),
  height VARCHAR2(50),
  length VARCHAR2(50),
  wheel_count NUMBER(4),
  constraint ROVER_PK PRIMARY KEY (id),
  constraint STATE_CHECK CHECK(state IN ('READY','DEPLOYING','DEPLOYED','LANDED'))
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


-- Mission Table --
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


-- Objectives Table --
CREATE TABLE Objectives (
  id NUMBER(4),
  mission_id NUMBER(4),
  name VARCHAR2(100),
  type VARCHAR2(50),
  description VARCHAR2(100),
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


-- PowerSource Table --
CREATE TABLE PowerSource (
  id NUMBER(4),
  rover_id NUMBER(4),
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


-- Computer Table --
CREATE TABLE Computer (
  id NUMBER(4),
  rover_id NUMBER(4),
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


-- Coordinate Table --
CREATE TABLE Coordinates (
  id NUMBER(4),
  computer_id NUMBER(4),
  image_id NUMBER(4) NULL,
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


-- Images Table --
CREATE TABLE Images (
  id NUMBER(4),
  camera_id NUMBER(4),
  storage_id NUMBER(4),
  data CLOB,
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


-- Copy Table --
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


-- Radiation Table --
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


-- Surface Radiation Table --
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


-- Interior Radiation Table --
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


-- Storage Table --
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


-- Camera Table --
CREATE TABLE Camera (
  id NUMBER(4),
  rover_id NUMBER(4),
  camera_type_id NUMBER(4),
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


-- CameraType Table --
CREATE TABLE CameraType (
  id NUMBER(4),
  type VARCHAR2(50),
  constraint CAMERATYPE_PK PRIMARY KEY (id)
)
/
CREATE sequence CAMERATYPE_SEQ
/
CREATE trigger BI_CAMERATYPE
  before insert on CameraType
  for each row
  begin
    select CAMERATYPE_SEQ.nextval into :NEW.id from dual;
  end;
/


-- MastSub Camera --
CREATE TABLE MastSubCamera (
  id NUMBER(4),
  camera_id NUMBER(4),
  name VARCHAR2(50),
  yield VARCHAR2(50),
  scale VARCHAR2(50),
  constraint MASTSUBCAMERA_PK PRIMARY KEY (id)
)
/
CREATE sequence MASTSUBCAMERA_SEQ
/
CREATE trigger BI_MATSUBCAMERA
  before insert on MastSubCamera
  for each row
  begin
    select MASTSUBCAMERA_SEQ.nextval into :NEW.id from dual;
  end;
/


-- Instrument Table --
CREATE TABLE Instrument (
  id NUMBER(4),
  camera_id NUMBER(4),
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


-- Sensor Table --
CREATE TABLE Sensor (
  id NUMBER(4),
  rover_id NUMBER(4),
  parent_id NUMBER(4),
  camera_id NUMBER(4) NULL,
  sensor_type_id NUMBER(4),
  name VARCHAR2(50),
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


-- SensorType Table --
CREATE TABLE SensorType (
  id NUMBER(4),
  type VARCHAR2(50),
  constraint SENSORTYPE_PK PRIMARY KEY (id)
)
/
CREATE sequence SENSORTYPE_SEQ
/
CREATE trigger BI_SENSORTYPE
  before insert on SensorType
  for each row
  begin
    select SENSORTYPE_SEQ.nextval into :NEW.id from dual;
  end;
/


-- SpaceCraft Table --
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


-- Communication Table --
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


-- Orbiter Table --
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

ALTER TABLE PowerSource ADD CONSTRAINT PowerSource_fk0 FOREIGN KEY (rover_id) REFERENCES Rover(id) ON DELETE CASCADE;

ALTER TABLE Computer ADD CONSTRAINT Computer_fk0 FOREIGN KEY (rover_id) REFERENCES Rover(id) ON DELETE CASCADE;

ALTER TABLE Coordinates ADD CONSTRAINT Coordinates_fk0 FOREIGN KEY (computer_id) REFERENCES Computer(id) ON DELETE CASCADE;
ALTER TABLE Coordinates ADD CONSTRAINT Coordinates_fk1 FOREIGN KEY (image_id) REFERENCES Images(id) ON DELETE CASCADE;

ALTER TABLE Images ADD CONSTRAINT Images_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;
ALTER TABLE Images ADD CONSTRAINT Images_fk1 FOREIGN KEY (storage_id) REFERENCES Storage(id) ON DELETE CASCADE;

ALTER TABLE Copy ADD CONSTRAINT Copy_fk0 FOREIGN KEY (computer_id) REFERENCES Computer(id) ON DELETE CASCADE;
ALTER TABLE Copy ADD CONSTRAINT Copy_fk1 FOREIGN KEY (coordinate_id) REFERENCES Coordinates(id) ON DELETE CASCADE;

ALTER TABLE Radiation ADD CONSTRAINT Radiation_fk0 FOREIGN KEY (coordinate_id) REFERENCES Coordinates(id) ON DELETE CASCADE;

ALTER TABLE Surface ADD CONSTRAINT Surface_fk0 FOREIGN KEY (radiation_id) REFERENCES Radiation(id) ON DELETE CASCADE;

ALTER TABLE Interior ADD CONSTRAINT Interior_fk0 FOREIGN KEY (radiation_id) REFERENCES Radiation(id) ON DELETE CASCADE;

ALTER TABLE Camera ADD CONSTRAINT Camera_fk0 FOREIGN KEY (rover_id) REFERENCES Rover(id) ON DELETE CASCADE;
ALTER TABLE Camera ADD CONSTRAINT Camera_fk1 FOREIGN KEY (camera_type_id) REFERENCES CameraType(id) ON DELETE CASCADE;

ALTER TABLE MastSubCamera ADD CONSTRAINT MastSubCamera_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;
ALTER TABLE Instrument ADD CONSTRAINT Instrument_fk0 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;

ALTER TABLE Sensor ADD CONSTRAINT Sensor_fk0 FOREIGN KEY (rover_id) REFERENCES Rover(id) ON DELETE CASCADE;
ALTER TABLE Sensor ADD CONSTRAINT Sensor_fk1 FOREIGN KEY (camera_id) REFERENCES Camera(id) ON DELETE CASCADE;
ALTER TABLE Sensor ADD CONSTRAINT Sensor_fk2 FOREIGN KEY (parent_id) REFERENCES Sensor(id) ON DELETE CASCADE;
ALTER TABLE Sensor ADD CONSTRAINT Sensor_fk3 FOREIGN KEY (sensor_type_id) REFERENCES SensorType(id) ON DELETE CASCADE;

ALTER TABLE Communication ADD CONSTRAINT Communication_fk0 FOREIGN KEY (rover_id) REFERENCES Rover(id) ON DELETE CASCADE;
ALTER TABLE Communication ADD CONSTRAINT Communication_fk1 FOREIGN KEY (orbiter_id) REFERENCES Orbiter(id) ON DELETE CASCADE;
