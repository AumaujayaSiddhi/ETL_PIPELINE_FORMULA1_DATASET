-- Databricks notebook source
USE f1_presentation;

-- COMMAND ----------

SELECT driver_name,
       count(1) AS total_races,
       SUM(calculated_points) AS total_points,
       round(avg(calculated_points),2) as avg_points
  FROM calculated_race_results
  WHERE race_year BETWEEN 2011 and 2020
  GROUP BY driver_name
  HAVING total_races > 50
  ORDER BY avg_points DESC

-- COMMAND ----------

SELECT race_year,
       driver_name,
       count(1) AS total_races,
       SUM(calculated_points) AS total_points,
       round(avg(calculated_points),2) as avg_points
  FROM calculated_race_results
  GROUP BY race_year, driver_name
  HAVING total_races > 50
  ORDER BY avg_points DESC

-- COMMAND ----------

