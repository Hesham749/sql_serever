USE VehicleMakesDB

SELECT COUNT(*) AS [total vehicles]
FROM VehicleDetails AS v
WHERE v.NumDoors is NULL
