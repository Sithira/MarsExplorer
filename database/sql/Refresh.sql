/*
  Delete all the TABLES, VIEWS, PROCEDURES, FUNCTIONS, SEQUENCES from the database
 */
BEGIN
  FOR cur_rec IN (SELECT object_name, object_type
                  FROM user_objects
                  WHERE object_type IN
                        ('TABLE',
                         'VIEW',
                         'PACKAGE',
                         'PROCEDURE',
                         'FUNCTION',
                         'SEQUENCE'
                        ))
  LOOP
    BEGIN
      IF cur_rec.object_type = 'TABLE'
      THEN
        EXECUTE IMMEDIATE    'DROP '
                             || cur_rec.object_type
                             || ' "'
                             || cur_rec.object_name
                             || '" CASCADE CONSTRAINTS';
      ELSE
        EXECUTE IMMEDIATE    'DROP '
                             || cur_rec.object_type
                             || ' "'
                             || cur_rec.object_name
                             || '"';
      END IF;
      EXCEPTION
      WHEN OTHERS
      THEN
        DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                 || cur_rec.object_type
                                 || ' "'
                                 || cur_rec.object_name
                                 || '"'
        );
    END;
  END LOOP;
END;

/*
 Create all the Database tables
 */

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
CREATE OR REPLACE trigger BI_ROVER
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
CREATE OR REPLACE trigger BI_MISSION
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
CREATE OR REPLACE trigger BI_OBJECTIVES
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
  current_level FLOAT,
  constraint POWERSOURCE_PK PRIMARY KEY (id)
)
/
CREATE sequence POWERSOURCE_SEQ
/
CREATE OR REPLACE trigger BI_POWERSOURCE
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
CREATE OR REPLACE trigger BI_COMPUTER
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
CREATE OR REPLACE trigger BI_COORDINATES
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
CREATE OR REPLACE trigger BI_IMAGES
  before insert on Images
  for each row
  begin
    select IMAGES_SEQ.nextval into :NEW.id from dual;
  end;
/


-- CoordinateCopy Table --
CREATE TABLE CoordinateCopy (
  id NUMBER(4),
  computer_id NUMBER(4),
  data VARCHAR2(50),
  constraint COPY_PK PRIMARY KEY (id)
)
/
CREATE sequence COORDINATECOPY_SEQ
/
CREATE OR REPLACE trigger BI_COORDINATECOPY
  before insert on CoordinateCopy
  for each row
  begin
    select COORDINATECOPY_SEQ.nextval into :NEW.id from dual;
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
CREATE OR REPLACE trigger BI_RADIATION
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
CREATE OR REPLACE trigger BI_SURFACE
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
CREATE OR REPLACE trigger BI_INTERIOR
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
CREATE OR REPLACE trigger BI_STORAGE
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
CREATE OR REPLACE trigger BI_CAMERA
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
CREATE OR REPLACE trigger BI_CAMERATYPE
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
CREATE OR REPLACE trigger BI_MATSUBCAMERA
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
CREATE OR REPLACE trigger BI_INSTRUMENT
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
CREATE OR REPLACE trigger BI_SENSOR
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
CREATE OR REPLACE trigger BI_SENSORTYPE
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
CREATE OR REPLACE trigger BI_SPACECRAFT
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
  orbiter_id NUMBER(4) NULL,
  cmode VARCHAR2(50),
  type VARCHAR2(50),
  band VARCHAR2(50),
  constraint COMMUNICATION_PK PRIMARY KEY (id),
  constraint TYPE_CHECK CHECK(type IN ('DIRECT','INDIRECT'))
)
/
CREATE sequence COMMUNICATION_SEQ
/
CREATE OR REPLACE trigger BI_COMMUNICATION
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
CREATE OR REPLACE trigger BI_ORBITER
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

ALTER TABLE CoordinateCopy ADD CONSTRAINT Copy_fk0 FOREIGN KEY (computer_id) REFERENCES Computer(id) ON DELETE CASCADE;

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

/*
  Insert Test Data into tables
 */
-- SPACECRAFT INSERT --
INSERT INTO SPACECRAFT (NAME, COUNTRY) VALUES ('Mars 2', 'China');
INSERT INTO SPACECRAFT (NAME, COUNTRY) VALUES ('Mars Pathfinder', 'USA');
INSERT INTO SPACECRAFT (NAME, COUNTRY) VALUES ('Mars 3', 'China');
INSERT INTO SPACECRAFT (NAME, COUNTRY) VALUES ('Beagle 2', 'Russia');



-- ORBITER INSERT --
INSERT INTO ORBITER (CMODE, TYPE, BAND, PLANET, ISMALFUNCTIONING) VALUES ('x-band', 'Opportunity Orbiter', '500bps', 'Mars', 0);
INSERT INTO ORBITER (CMODE, TYPE, BAND, PLANET, ISMALFUNCTIONING) VALUES ('UHF', 'Beagle Orbiter', '1500bps', 'Mars', 1);
INSERT INTO ORBITER (CMODE, TYPE, BAND, PLANET, ISMALFUNCTIONING) VALUES ('x-band', 'Odyssey Orbiter', '320000bps', 'Mars', 0);
INSERT INTO ORBITER (CMODE, TYPE, BAND, PLANET, ISMALFUNCTIONING) VALUES ('UHF', 'Curiosity Orbiter', '10000bps', 'Mars', 1);


-- STORAGE INSERT --
INSERT INTO STORAGE (TYPE, CAPACITY) VALUES ('A', '100TB');
INSERT INTO STORAGE (TYPE, CAPACITY) VALUES ('B', '500TB');
INSERT INTO STORAGE (TYPE, CAPACITY) VALUES ('C', '1000TB');


-- MISSION INSERT --
INSERT INTO MISSION
(SPACECRAFT_ID, NAME, PLANET, YEAR) VALUES
  (1, 'Mars Exploration Rover', 'Mars', TO_DATE('1990-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MISSION
(SPACECRAFT_ID, NAME, PLANET, YEAR) VALUES
  (2, 'Planetary Undersurface Tool', 'Mars', TO_DATE('2003-05-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MISSION
(SPACECRAFT_ID, NAME, PLANET, YEAR) VALUES
  (3, 'Mars Pathfinder', 'Mars', TO_DATE('1997-07-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MISSION
(SPACECRAFT_ID, NAME, PLANET, YEAR) VALUES
  (4, 'Mars Science Laboratory', 'Mars', TO_DATE('2011-11-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));


-- OBJECTIVES INSERT --
INSERT INTO OBJECTIVES (MISSION_ID, NAME, TYPE, DESCRIPTION) VALUES (1, 'Determine present state, distribution, and cycling of water and carbon dioxide', 'Planetary Process', 'aajvos adodvda dom lmd daosid sdpin');
INSERT INTO OBJECTIVES (MISSION_ID, NAME, TYPE, DESCRIPTION) VALUES (2, 'Determine the nature and inventory of organic carbon compounds', 'Biological', 'knca kan oua aoa ja aca ddad ladpia');
INSERT INTO OBJECTIVES (MISSION_ID, NAME, TYPE, DESCRIPTION) VALUES (3, 'Interpret the processes that have formed and modified rocks and soils', 'Geological and geochemical', 'aajvos adodvda dom lmd daosid sdpin');
INSERT INTO OBJECTIVES (MISSION_ID, NAME, TYPE, DESCRIPTION) VALUES (4, 'Measure Surface and interior radiation of the journey', 'Surface rdiation', 'knca kan oua aoa ja aca ddad ladpia');


-- ROVER INSERT --
INSERT INTO ROVER (MISSION_ID, NAME, STATE, WIDTH, HEIGHT, LENGTH, WHEEL_COUNT) VALUES (1, 'Opportunity', 'DEPLOYING', '2.3m', '1.5m', '1.6m', 6);
INSERT INTO ROVER (MISSION_ID, NAME, STATE, WIDTH, HEIGHT, LENGTH, WHEEL_COUNT) VALUES (2, 'Beagle 2', 'LANDED', '1m', '0.25m', '1.5m', 4);
INSERT INTO ROVER (MISSION_ID, NAME, STATE, WIDTH, HEIGHT, LENGTH, WHEEL_COUNT) VALUES (3, 'Sojourner', 'READY', '0.7m', '1m', '0.65m', 6);
INSERT INTO ROVER (MISSION_ID, NAME, STATE, WIDTH, HEIGHT, LENGTH, WHEEL_COUNT) VALUES (4, 'Curiosity', null, '2.7m', '2.2m', '2.9', 6);


-- COMPUTER INSERT --
INSERT INTO COMPUTER (ROVER_ID, EEPROM, DRAM, FLASH) VALUES (1, '2GB', '500MB', '1GB');
INSERT INTO COMPUTER (ROVER_ID, EEPROM, DRAM, FLASH) VALUES (2, '3GB', '125MB', '2GB');
INSERT INTO COMPUTER (ROVER_ID, EEPROM, DRAM, FLASH) VALUES (3, '2GB', '250MB', '1GB');
INSERT INTO COMPUTER (ROVER_ID, EEPROM, DRAM, FLASH) VALUES (4, '4GB', '125MB', '1GB');


-- COMMUNICATION INSERT --
INSERT INTO COMMUNICATION (ROVER_ID, ORBITER_ID, CMODE, TYPE, BAND) VALUES (1, 1, 'UHF', 'INDIRECT', '10Mb');
INSERT INTO COMMUNICATION (ROVER_ID, ORBITER_ID, CMODE, TYPE, BAND) VALUES (2, 2, 'x-band', 'INDIRECT', '100Mb');
INSERT INTO COMMUNICATION (ROVER_ID, ORBITER_ID, CMODE, TYPE, BAND) VALUES (3, 3, 'x-band', 'INDIRECT', '250Mb');
INSERT INTO COMMUNICATION (ROVER_ID, ORBITER_ID, CMODE, TYPE, BAND) VALUES (4, null, 'UHF', 'DIRECT', '10000bps');


-- CAMERATYPE INSERT --
INSERT INTO CAMERATYPE (TYPE) VALUES ('HazCam');
INSERT INTO CAMERATYPE (TYPE) VALUES ('NavCam');
INSERT INTO CAMERATYPE (TYPE) VALUES ('MastCam');
INSERT INTO CAMERATYPE (TYPE) VALUES ('MAHLI');
INSERT INTO CAMERATYPE (TYPE) VALUES ('MARDI');
INSERT INTO CAMERATYPE (TYPE) VALUES ('ChemCam');
INSERT INTO CAMERATYPE (TYPE) VALUES ('PanCam');


-- CAMERA INSERT --
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (1, 1, 0, 'HazCam', '23mm', '120°', '1600 x 1200');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (1, 2, 1, 'NavCam', '50mm', '45°', '3840 x 2160');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (1, 6, 0, 'ChemCam', '25mm', '40.3°', '3840 x 2160');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (1, 7, 0, 'PanCam', '38mm', '45°', '4000 x 24000');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (2, 1, 0, 'HazCam', '32mm', '60°', '1600 x 1200');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (3, 2, 0, 'NavCam', '34mm', '40°', '3840 x 2160');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (3, 3, 0, 'MastCam 1', '34mm', '15°', '1280 x 720');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (3, 5, 1, 'MARDI', '30mm', '35.8°', '4096 x 2160');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (4, 3, 0, 'MastCam 2', '100mm', '5.1°', '7280 x 4320');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (4, 4, 0, 'MAHLI', '21.3mm', '38.5°', '1600 x 1200');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (4, 4, 0, 'MARDI', '28mm', '35°', '4096 x 2160');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (4, 2, 1, 'NavCam', '50mm', '45°', '3840 x 2160');
INSERT INTO CAMERA
(ROVER_ID, CAMERA_TYPE_ID, ISMAINCAM, NAME, FOCAL_LENGTH, FIELD_OF_VIEW, RESOLUTION)
VALUES (4, 6, 0, 'ChemCam', '25mm', '40.3°', '3840 x 2160');


-- MASTSUBCAMERA INSERT --
INSERT INTO MASTSUBCAMERA (CAMERA_ID, NAME, YIELD, SCALE) VALUES (1, 'MAC', '22cm/pixel', '1km');
INSERT INTO MASTSUBCAMERA (CAMERA_ID, NAME, YIELD, SCALE) VALUES (2, 'NAC', '7.4cm/pixel', '1km');


-- IMAGES INSERT --
INSERT INTO IMAGES (CAMERA_ID, STORAGE_ID, DATA, SIGNIFICANCE, RESOLUTION) VALUES (1, 1, 'Image 1', 75, '1600 x 1200');
INSERT INTO IMAGES (CAMERA_ID, STORAGE_ID, DATA, SIGNIFICANCE, RESOLUTION) VALUES (2, 2, 'Image 2', 55, '3840 x 2160');
INSERT INTO IMAGES (CAMERA_ID, STORAGE_ID, DATA, SIGNIFICANCE, RESOLUTION) VALUES (3, 2, 'Image 3', 60, '4096 x 2160');
INSERT INTO IMAGES (CAMERA_ID, STORAGE_ID, DATA, SIGNIFICANCE, RESOLUTION) VALUES (4, 3, 'Image 4', 32, '1280 x 720');


-- COORDINATE INSERT --
INSERT INTO COORDINATES (COMPUTER_ID, IMAGE_ID, DATA) VALUES (1, 1, '48.218830° N, 234.250778° E');
INSERT INTO COORDINATES (COMPUTER_ID, IMAGE_ID, DATA) VALUES (2, 2, '34.218830°N, 154.250778°E');
INSERT INTO COORDINATES (COMPUTER_ID, IMAGE_ID, DATA) VALUES (3, 3, '61.218830° N, 134.250778° E');
INSERT INTO COORDINATES (COMPUTER_ID, IMAGE_ID, DATA) VALUES (4, 4, '58.218830° N, 244.250778° E');


-- COORDINATECOPY INSERT --
INSERT INTO COORDINATECOPY (COMPUTER_ID, DATA) VALUES (1, '48.218830° N, 234.250778° E');
INSERT INTO COORDINATECOPY (COMPUTER_ID, DATA) VALUES (2, '34.218830°N, 154.250778°E');
INSERT INTO COORDINATECOPY (COMPUTER_ID, DATA) VALUES (3, '61.218830° N, 134.250778° E');
INSERT INTO COORDINATECOPY (COMPUTER_ID, DATA) VALUES (4, '58.218830° N, 244.250778° E');


-- RADIATION INSERT --
INSERT INTO RADIATION (COORDINATE_ID, RADLEVEL, TYPE) VALUES (1, '200mrad/d', 'cosmic');
INSERT INTO RADIATION (COORDINATE_ID, RADLEVEL, TYPE) VALUES (2, '100mrad/d', 'cosmic');
INSERT INTO RADIATION (COORDINATE_ID, RADLEVEL, TYPE) VALUES (3, '25mrad/d', 'gamma');
INSERT INTO RADIATION (COORDINATE_ID, RADLEVEL, TYPE) VALUES (4, '50mrad/d', 'X');


-- SURFACE INSERT --
INSERT INTO SURFACE (RADIATION_ID, LANDINGSITE) VALUES (1, 'Aeolis Palus');
INSERT INTO SURFACE (RADIATION_ID, LANDINGSITE) VALUES (2, 'Peace Vallis');
INSERT INTO SURFACE (RADIATION_ID, LANDINGSITE) VALUES (3, 'Aeolis Mons');
INSERT INTO SURFACE (RADIATION_ID, LANDINGSITE) VALUES (4, 'Gale Crater');


-- INTERIOOR INSERT --
INSERT INTO INTERIOR (RADIATION_ID, DISTANCE) VALUES (1, 500000);
INSERT INTO INTERIOR (RADIATION_ID, DISTANCE) VALUES (2, 800000);
INSERT INTO INTERIOR (RADIATION_ID, DISTANCE) VALUES (3, 20000);
INSERT INTO INTERIOR (RADIATION_ID, DISTANCE) VALUES (4, 100000);


-- INSTRUMENT INSERT --
INSERT INTO INSTRUMENT (CAMERA_ID, NAME, PURPOSE) VALUES (1, 'LIBS', 'provide elemental compositions');
INSERT INTO INSTRUMENT (CAMERA_ID, NAME, PURPOSE) VALUES (1, 'RMI', 'give high-resolution images');
INSERT INTO INSTRUMENT (CAMERA_ID, NAME, PURPOSE) VALUES (2, 'LIBS', 'provide elemental compositions');
INSERT INTO INSTRUMENT (CAMERA_ID, NAME, PURPOSE) VALUES (3, 'RMI', 'give high-resolution images');


-- SENSORTYPE INSERT --
INSERT INTO SENSORTYPE (TYPE) VALUES ('Infrared spectrometer');
INSERT INTO SENSORTYPE (TYPE) VALUES ('spectrometer');
INSERT INTO SENSORTYPE (TYPE) VALUES ('X-Ray spectrometer');
INSERT INTO SENSORTYPE (TYPE) VALUES ('spectrometer');


-- SENSOR INSERT --
INSERT INTO SENSOR (ROVER_ID, PARENT_ID, CAMERA_ID, SENSOR_TYPE_ID, NAME) VALUES (1, 1, 1, 1, 'Mini-TES');
INSERT INTO SENSOR (ROVER_ID, PARENT_ID, CAMERA_ID, SENSOR_TYPE_ID, NAME) VALUES (2, 1, 2, 2, 'Mössbauer');
INSERT INTO SENSOR (ROVER_ID, PARENT_ID, CAMERA_ID, SENSOR_TYPE_ID, NAME) VALUES (3, 1, 3, 3, 'APXS');
INSERT INTO SENSOR (ROVER_ID, PARENT_ID, CAMERA_ID, SENSOR_TYPE_ID, NAME) VALUES (4, 1, 4, 4, 'SAM');


-- POWERSOURCE INSERT --
INSERT INTO POWERSOURCE
(ROVER_ID, NAME, CURRENT_LEVEL)
VALUES (1, 'Nuclear generator', 3);
INSERT INTO POWERSOURCE
(ROVER_ID, NAME, CURRENT_LEVEL)
VALUES (2, 'Solar power', 10);
INSERT INTO POWERSOURCE
(ROVER_ID, NAME, CURRENT_LEVEL)
VALUES (3, 'Solar power', 45);
INSERT INTO POWERSOURCE
(ROVER_ID, NAME, CURRENT_LEVEL)
VALUES (4, 'Nuclear generator', 80);

/*
  Triggers
 */
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


/*
  Functions
 */

-- Get Total volume of a Rover by passing Rover ID --
CREATE OR REPLACE FUNCTION TOTAL_VOLUME(rover_id number)
  RETURN float IS
  volume   float;
  height   number;
  length   number;
  width    number;
  r_height varchar2(10);
  r_length varchar2(10);
  r_width  varchar2(10);

  BEGIN
    SELECT
      HEIGHT,
      LENGTH,
      WIDTH
    into r_height, r_length, r_width
    FROM ROVER
    WHERE id = rover_id;
    r_height := replace(r_height, 'm');
    height := to_number(r_height);
    dbms_output.put_line(height);

    r_length := replace(r_length, 'm');
    length := to_number(r_length);
    dbms_output.put_line(length);

    r_width := replace(r_width, 'm');
    width := to_number(r_width);
    dbms_output.put_line(width);

    volume := height * length * width;
    RETURN volume;
  END;
/

-- Check whether the communication is direct or indirect --
CREATE OR REPLACE FUNCTION IS_DIRECT_COMMUNICATION(communication_id number)

  RETURN boolean IS
  com_orbiter_id number;

  BEGIN
    SELECT ORBITER_ID
    into com_orbiter_id
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
/


-- Get the All sensors of a Rover when a rover id is given --
CREATE OR REPLACE FUNCTION GET_SENSORS(ROVERID IN NUMBER)

  RETURN SYS_REFCURSOR

AS output SYS_REFCURSOR;

  BEGIN

    OPEN output
    FOR SELECT *
        FROM SENSOR SEN
          JOIN SENSORTYPE S on SEN.SENSOR_TYPE_ID = S.ID
        WHERE SEN.ROVER_ID = ROVERID;
    RETURN output;

  END;
/

-- Get all the Sensors that belongs to a certain type --
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
/


-- Get the coordinates of a ROVER --
CREATE OR REPLACE FUNCTION GET_COORDINATES(ROVERID IN NUMBER)

  RETURN SYS_REFCURSOR

AS output SYS_REFCURSOR;

  BEGIN

    OPEN output
    FOR SELECT *
        FROM COORDINATES CORDS
          JOIN COMPUTER C2 on CORDS.COMPUTER_ID = C2.ID
        WHERE C2.ROVER_ID = ROVERID;

    RETURN output;

  END;
/


/*
  Procedures
 */


-- Get the no.of Cameras when Rover ID and Camera type is given --
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


-- Get the number of malfunctioning orbiters for a given rover --
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


-- Make a random orbiter malfunction --
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


-- Dynamically set the main camera of the given rover --
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