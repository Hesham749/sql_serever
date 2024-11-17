USE VehicleMakesDB

SELECT m.Make , COUNT(*) AS [number of vehicle]
FROM VehicleDetails as v JOIN Makes AS m
    ON v.MakeID = m.MakeID
WHERE [Year] BETWEEN 1960 AND 2000
GROUP BY m.Make
HAVING COUNT(*) > 12000

SELECT *
FROM (
SELECT m.Make , COUNT(*) AS [number of vehicle]
    FROM VehicleDetails as v JOIN Makes AS m
        ON v.MakeID = m.MakeID
    WHERE [Year] BETWEEN 1960 AND 2000
    GROUP BY m.Make) as new
WHERE [number of vehicle] > 12000