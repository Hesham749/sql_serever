USE VehicleMakesDB



SELECT(
    (SELECT COUNT(*)
    FROM VehicleDetails)*1.0 / (SELECT COUNT(*) AS [total vehicles]
    FROM VehicleDetails AS v
    WHERE v.NumDoors is NULL )*1.0) AS PERCENTAGE