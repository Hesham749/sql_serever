USE VehicleMakesDB

SELECT COUNT(*) AS [total makes]
FROM VehicleDetails AS v
    JOIN DriveTypes AS d
    ON v.DriveTypeID = d.DriveTypeID
WHERE d.DriveTypeName = 'FWD'

