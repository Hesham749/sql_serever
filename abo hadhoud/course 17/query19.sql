USE VehicleMakesDB

SELECT d.DriveTypeName , m.Make, COUNT(*) AS [total makes]
FROM VehicleDetails AS v
    JOIN Makes AS m
    ON v.MakeID = m.MakeID
    JOIN DriveTypes AS d
    ON v.DriveTypeID = d.DriveTypeID
GROUP BY d.DriveTypeName , m.Make
HAVING COUNT(*) > 10000
ORDER BY m.Make , [total makes] DESC

