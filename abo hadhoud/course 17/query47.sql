USE VehicleMakesDB




SELECT TOP 3
    m.Make, COUNT(*) AS [number of models]
FROM MakeModels  AS mm JOIN Makes AS m
    ON mm.MakeID = m.MakeID
GROUP BY m.Make
ORDER BY [number of models] DESC