USE VehicleMakesDB


SELECT *
FROM VehicleDetails
WHERE Engine_CC < (
SELECT AVG(Engine_CC) AS x
FROM VehicleDetails )