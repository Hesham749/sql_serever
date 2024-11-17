USE VehicleMakesDB

SELECT COUNT(*) AS [number of vehicles]
FROM VehicleDetails
WHERE [Year] BETWEEN 1950 and 2000