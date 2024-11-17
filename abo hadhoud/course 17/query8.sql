USE VehicleMakesDB


SELECT m.Make , f.FuelTypeName , COUNT(*) AS [number of vehicle]
FROM VehicleDetails AS v join Makes AS m ON v.MakeID = m.MakeID JOIN FuelTypes AS f ON v.FuelTypeID = f.FuelTypeID
WHERE v.[Year] BETWEEN 1950 AND 2000
GROUP BY f.FuelTypeName , m.Make
ORDER BY Make
