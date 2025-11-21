/* Write your T-SQL query statement below */
WITH A AS (
    SELECT 
          driver_id,
          AVG(CASE WHEN DATEPART(MONTH, trip_date) BETWEEN 0 AND 6
                   THEN distance_km / fuel_consumed END) AS firstavg,
          AVG(CASE WHEN DATEPART(MONTH, trip_date) BETWEEN 7 AND 12
                   THEN distance_km / fuel_consumed END) AS secondavg
    FROM trips
    GROUP BY driver_id
)
SELECT 
      A.driver_id,
      d.driver_name,
      ROUND(A.firstavg, 2) AS first_half_avg,
      ROUND(A.secondavg, 2) AS second_half_avg,
      ROUND(A.secondavg - a.firstavg, 2) AS efficiency_improvement
FROM A 
    JOIN drivers d 
    ON A.driver_id = d.driver_id
WHERE A.secondavg > A.firstavg
ORDER BY efficiency_improvement DESC, driver_name 