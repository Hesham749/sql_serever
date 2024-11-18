USE VehicleMakesDB


SELECT *
FROM VehicleDetails
WHERE Engine_CC = (
SELECT max(Engine_CC) AS x
FROM VehicleDetails )