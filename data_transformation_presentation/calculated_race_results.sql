-- Databricks notebook source
USE f1_processed;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS f1_presentation.calculated_race_results
USING parquet
SELECT f1_processed.races.race_year,
       f1_processed.drivers.driver_name AS driver_name,
       f1_processed.constructors.name AS team_name,
       f1_processed.results.position,
       f1_processed.results.points,
       11 - f1_processed.results.position AS calculated_points
  FROM f1_processed.results 
    JOIN f1_processed.drivers ON results.driver_id = drivers.driver_id
    JOIN f1_processed.constructors ON results.constructor_id = constructors.constructor_id
    JOIN f1_processed.races ON results.race_id = races.race_id
  WHERE f1_processed.results.position <= 10

-- COMMAND ----------

SELECT * FROM f1_presentation.calculated_race_results

-- COMMAND ----------

