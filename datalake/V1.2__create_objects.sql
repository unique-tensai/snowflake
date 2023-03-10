-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS SCHEMACHANGE_DEMO;

-- Set the database and schema context
USE SCHEMA SCHEMACHANGE_DEMO.PUBLIC;

-- Create the file formats
CREATE OR REPLACE FILE FORMAT CSV_NO_HEADER
    TYPE='CSV'
    COMPRESSION = 'AUTO'
    FIELD_DELIMITER = ','
    SKIP_HEADER = 0
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    NULL_IF = ('NULL','\\N','\N', '');

CREATE OR REPLACE FILE FORMAT JSON
    TYPE='JSON'
    COMPRESSION = 'AUTO'
    ENABLE_OCTAL = FALSE
    ALLOW_DUPLICATE = FALSE
    STRIP_OUTER_ARRAY = FALSE
    STRIP_NULL_VALUES = FALSE
    IGNORE_UTF8_ERRORS = FALSE;

-- Create the stages
CREATE OR REPLACE STAGE TRIPS
    URL = 'http://demoecomapp.tensai.click/';

CREATE OR REPLACE STAGE WEATHER
    URL = 's3://snowflake-workshop-lab/weather-nyc';

-- Create the tables
CREATE OR REPLACE TABLE TRIPS
(
     TRIPDURATION INTEGER
    ,STARTTIME TIMESTAMP
    ,STOPTIME TIMESTAMP
    ,START_STATION_ID INTEGER
    ,START_STATION_NAME STRING
    ,START_STATION_LATITUDE FLOAT
    ,START_STATION_LONGITUDE FLOAT
    ,END_STATION_ID INTEGER
    ,END_STATION_NAME STRING
    ,END_STATION_LATITUDE FLOAT
    ,END_STATION_LONGITUDE FLOAT
    ,BIKEID INTEGER
    ,MEMBERSHIP_TYPE STRING
    ,USERTYPE STRING
    ,BIRTH_YEAR INTEGER
    ,GENDER INTEGER
);

CREATE OR REPLACE TABLE WEATHER
(
     V VARIANT
    ,T TIMESTAMP
);
