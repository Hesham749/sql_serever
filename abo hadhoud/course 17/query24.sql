USE VehicleMakesDB



SELECT *
FROM VehicleDetails AS v
WHERE v.Engine_Liter_Display > 3 AND v.NumDoors =2