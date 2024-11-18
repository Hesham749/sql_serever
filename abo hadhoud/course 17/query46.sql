USE VehicleMakesDB


SELECT m.Make, COUNT(v.ModelID) AS [number of models]
FROM VehicleDetails AS v JOIN Makes AS m
    ON v.MakeID = m.MakeID
GROUP BY m.Make
ORDER BY [number of models] DESC