USE VehicleMakesDB


SELECT *
FROM VehicleDetails
WHERE Engine_CC = (
SELECT min(Engine_CC) AS x
FROM VehicleDetails )