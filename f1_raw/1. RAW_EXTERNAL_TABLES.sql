-- Databricks notebook source
-- MAGIC %md
-- MAGIC There are two types of 
-- MAGIC 1. Managed Tables : These are maintained by database workspace itself. That means, schema and storage is maintained by databricks workspace, the creation and dropping of this tables relies completely on databricks workspace. Dropping the table also drops its storage
-- MAGIC 2. External Tables : I this only schema/database is maintained by workspace where as storage is maintained by user

-- COMMAND ----------

CREATE DATABASE IF NOT EXISTS f1_raw;

-- COMMAND ----------

DESCRIBE DATABASE EXTENDED f1_raw;

-- COMMAND ----------

SHOW DATABASES;

-- COMMAND ----------

USE f1_raw;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC For raw folder create external tables

-- COMMAND ----------

DROP TABLE IF EXISTS circuits;
CREATE TABLE IF NOT EXISTS circuits (
  circuitId INT,
  circuitRef STRING,
  name STRING,
  location STRING,
  country STRING,
  lat DOUBLE,
  lng DOUBLE,
  alt INTEGER,
  url STRING
)
USING csv
OPTIONS (path "/mnt/formula1dlsiddhi/raw/circuits.csv", header true)

-- COMMAND ----------

SELECT * FROM f1_raw.circuits;

-- COMMAND ----------

DROP TABLE IF EXISTS races;
CREATE TABLE IF NOT EXISTS races (
  raceId INT,
  year INT,
  round INT,
  circuitId INT,
  name STRING,
  date STRING,
  time STRING,
  url STRING
)
USING csv
OPTIONS (path "/mnt/formula1dlsiddhi/raw/races.csv", header true)

-- COMMAND ----------

SELECT * FROM f1_raw.races;

-- COMMAND ----------

DROP TABLE IF EXISTS constructors;
CREATE TABLE IF NOT EXISTS constructors (
  constructorId INT, 
  constructorRef STRING, 
  name STRING, 
  nationality STRING, 
  url STRING
)
USING json
OPTIONS (path "/mnt/formula1dlsiddhi/raw/constructors.json")

-- COMMAND ----------

SELECT * FROM f1_raw.constructors;

-- COMMAND ----------

DROP TABLE IF EXISTS f1_raw.drivers;
CREATE TABLE IF NOT EXISTS f1_raw.drivers (
  code STRING, 
  dob STRING, 
  driverId LONG, 
  driverRef STRING, 
  name STRUCT<forename:STRING, surname:STRING>,
  nationality STRING,
  number INT,
  url STRING
)
USING json
OPTIONS (path "/mnt/formula1dlsiddhi/raw/drivers.json")

-- COMMAND ----------

SELECT * FROM f1_raw.drivers;

-- COMMAND ----------

DROP TABLE IF EXISTS results;
CREATE TABLE IF NOT EXISTS results (
  resultId INT,
  raceId INT,
  driverId INT,
  constructorId INT,
  number INT,
  grid INT,
  position INT,
  positionText STRING,
  positionOrder INT,
  points FLOAT,
  laps INT,
  time STRING,
  milliseconds INT,
  fastestLap INT,
  rank INT,
  fastestLapTime STRING,
  fastestLapSpeed STRING,
  statusId INT
)
USING json
OPTIONS (path "/mnt/formula1dlsiddhi/raw/results.json")

-- COMMAND ----------

SELECT * FROM f1_raw.results;

-- COMMAND ----------

DROP TABLE IF EXISTS f1_raw.pit_stops;
CREATE TABLE IF NOT EXISTS f1_raw.pit_stops (
  raceId INT, 
  driverId INT, 
  stop INT, 
  lap INT, 
  time STRING,
  duration STRING,
  milliseconds INT
)
USING json
OPTIONS (path "/mnt/formula1dlsiddhi/raw/pit_stops.json", multiLine true)

-- COMMAND ----------

SELECT * FROM f1_raw.pit_stops;

-- COMMAND ----------

DROP TABLE IF EXISTS lap_times;
CREATE TABLE IF NOT EXISTS lap_times (
  raceId INT,
  driverId INT,
  lap INT,
  position INT,
  time STRING,
  milliseconds INT
)
USING csv
OPTIONS (path "/mnt/formula1dlsiddhi/raw/lap_times/")

-- COMMAND ----------

SELECT * FROM f1_raw.lap_times;

-- COMMAND ----------

DROP TABLE IF EXISTS qualifying;
CREATE TABLE IF NOT EXISTS qualifying (
  qualifyingId INT,
  raceId INT,
  driverId INT,
  constructorId INT,
  number INT,
  position INT,
  q1 STRING,
  q2 STRING,
  q3 STRING
)
USING json
OPTIONS (path "/mnt/formula1dlsiddhi/raw/qualifying/", multiLine true)

-- COMMAND ----------

SELECT * FROM f1_raw.qualifying;

-- COMMAND ----------

SHOW TABLES IN f1_raw;

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.notebook.exit("success...")

-- COMMAND ----------

