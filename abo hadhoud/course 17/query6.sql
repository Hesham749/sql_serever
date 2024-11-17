USE VehicleMakesDB

SELECT m.Make, COUNT(*) AS [number of vehicles] , (select COUNT(*)
    FROM VehicleDetails) AS [total vehicles]
FROM VehicleDetails AS v JOIN Makes AS m
    ON v.MakeID = m.MakeID
WHERE [Year] BETWEEN 1950 AND 2000
GROUP BY Make
