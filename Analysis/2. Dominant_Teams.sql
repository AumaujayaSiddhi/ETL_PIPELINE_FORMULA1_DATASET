-- Databricks notebook source
USE f1_presentation;

-- COMMAND ----------

SELECT * FROM calculated_race_results

-- COMMAND ----------

SELECT team_name,
       count(1) AS total_races,
       SUM(calculated_points) AS total_points,
       round(avg(calculated_points),2) as avg_points
  FROM calculated_race_results
  WHERE race_year BETWEEN 2011 and 2020
  GROUP BY team_name
  HAVING total_races > 100
  ORDER BY avg_points DESC

-- COMMAND ----------

SELECT team_name,
       count(1) AS total_races,
       SUM(calculated_points) AS total_points,
       round(avg(calculated_points),2) as avg_points
  FROM calculated_race_results
  WHERE race_year BETWEEN 2001 and 2010
  GROUP BY team_name
  HAVING total_races > 100
  ORDER BY avg_points DESC

-- COMMAND ----------

