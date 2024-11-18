USE VehicleMakesDB

SELECT MIN(Engine_CC) AS min , MAX(Engine_CC) AS MAX , AVG(Engine_CC) AS average
FROM VehicleDetails