USE VehicleMakesDB

SELECT COUNT(*) AS totalMakeRunOnGas
FROM
    (SELECT m.Make , f.FuelTypeName
    FROM VehicleDetails AS v join FuelTypes AS f ON  v.FuelTypeID = f.FuelTypeID JOIN Makes AS m ON v.MakeID = m.MakeID
    WHERE FuelTypeName = N'GAS'
    GROUP BY m.Make , f.FuelTypeName) r1



    