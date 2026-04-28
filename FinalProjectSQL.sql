-- All Data
SELECT COUNT(*) FROM protests;
-- Country count
SELECT COUNT(DISTINCT country_name) FROM protests;

-- Year period
SELECT MIN(year), MAX(year) FROM protests;

--Check empty data
SELECT
  COUNT(*) FILTER (WHERE year IS NULL) AS missing_year,
  COUNT(*) FILTER (WHERE country_name IS NULL) AS missing_country
FROM protests;
---------------------------------------------------------------------
--Protest by Year
SELECT year, COUNT(*) AS protest_count
FROM protests
GROUP BY year
ORDER BY year;
----------------------------------------------------------------------
-- Top 10 Countries
SELECT country_name, COUNT(*) AS total_protests
FROM protests
GROUP BY country_name
ORDER BY total_protests DESC
LIMIT 10;
---------------------------------------------------------------------
-- Protest by Region
SELECT Region , COUNT(*) AS total_protests
FROM protests
GROUP BY Region
ORDER BY total_protests DESC
LIMIT 10;
--------------------------------------------------------------------
--Violent vs Non‑Violent 
SELECT protester_violence, COUNT(*) 
FROM protests
GROUP BY protester_violence;
--------------------------------------------------------------------
--Protest count / violent protests
SELECT
  year,
  COUNT(*) AS protest_count,
  SUM(CASE WHEN protester_violence = '1' THEN 1 ELSE 0 END) AS violent_protests
FROM protests
GROUP BY year
ORDER BY year;
---------------------------------------------------------------------
--Trend of Protests in Iran Over Time
SELECT year, COUNT(*) AS protests_in_iran
FROM protests
WHERE country_name = 'Iran'
GROUP BY year
ORDER BY year;
---------------------------------------------------------------------
--Number of Protests by City in Iran
SELECT protests.location_of_protest, COUNT(*) AS protest_count
FROM protests
WHERE country_name = 'Iran'
GROUP BY protests.location_of_protest
ORDER BY protest_count DESC;
---------------------------------------------------------------------
--Protests in Tehran Over Time
SELECT year, COUNT(*) AS tehran_protests
FROM protests
WHERE  protests.location_of_protest = 'Tehran'
GROUP BY year
ORDER BY year;
---------------------------------------------------------------------
--Comparison of Violent and Non‑Violent Protests in Iran
SELECT protester_violence, COUNT(*) AS total
FROM protests
WHERE country_name = 'Iran'
GROUP BY protester_violence;
--------------------------------------------------------------------
--Primary Protester Demands in Iran
SELECT
  demand_1,
  COUNT(*) AS total
FROM protests
WHERE country_name = 'Iran'
GROUP BY demand_1
ORDER BY total DESC
LIMIT 10;

----------------------------------------------------------------------
--State Response to Protests in Iran
SELECT
  response_1,
  COUNT(*) AS total
FROM protests
WHERE country_name = 'Iran'
GROUP BY response_1
ORDER BY total DESC;
-----------------------------------------------------------------------
--Protester Group Identity in Iran
SELECT
  protester_group_identity,
  COUNT(*) AS total
FROM protests
WHERE country_name = 'Iran'
GROUP BY protester_group_identity
ORDER BY total DESC;
-----------------------------------------------------------------------
--Number of Protests by City in Iran
SELECT
  location_of_protest,
  COUNT(*) AS total
FROM protests
WHERE country_name = 'Iran'
GROUP BY location_of_protest
ORDER BY total DESC;






