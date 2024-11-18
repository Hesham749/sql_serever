USE VehicleMakesDB


SELECT m.Make , isnull(sum(NumDoors),0) AS TotalNumberOfDoors
FROM VehicleDetails AS v JOIN Makes AS m
    ON v.MakeID = m.MakeID
GROUP BY m.Make
ORDER BY TotalNumberOfDoors DESC