USE VehicleMakesDB

SELECT m.Make
FROM VehicleDetails AS v JOIN Makes AS m
    ON v.MakeID = m.MakeID
    JOIN DriveTypes AS d
    ON v.DriveTypeID = d.DriveTypeID
WHERE d.DriveTypeName = 'FWD'
GROUP BY m.Make
