USE VehicleMakesDB


SELECT DISTINCT m.Make
FROM
    VehicleDetails AS v JOIN Makes AS m
    ON v.MakeID = m.MakeID
WHERE Engine_CC IN (
SELECT DISTINCT TOP 3
    Engine_CC
FROM VehicleDetails
ORDER BY Engine_CC DESC)
ORDER BY m.Make