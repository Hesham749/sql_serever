USE VehicleMakesDB


SELECT v.*
FROM VehicleDetails AS v join FuelTypes AS f
ON v.FuelTypeID = f.FuelTypeID
WHERE FuelTypeName = N'GAS'