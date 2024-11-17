USE VehicleMakesDB

SELECT m.Make
FROM VehicleDetails AS v JOIN Makes AS m
    ON v.MakeID = m.MakeID
WHERE m.Make LIKE '%w'
GROUP BY m.Make
