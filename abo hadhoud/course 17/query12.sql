USE VehicleMakesDB

SELECT m.Make , COUNT(*) AS [number of vehicle]
FROM VehicleDetails AS v JOIN Makes AS m
    ON v.MakeID = m.MakeID
GROUP BY m.Make
ORDER BY [number of vehicle] DESC
