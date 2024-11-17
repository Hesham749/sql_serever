USE VehicleMakesDB

SELECT m.Make , COUNT(*) AS [number of vehicles]
FROM VehicleDetails as v JOIN Makes AS m
ON v.MakeID = m.MakeID
WHERE [Year] BETWEEN 1950 and 2000
GROUP BY m.Make
ORDER BY [number of vehicles] DESC