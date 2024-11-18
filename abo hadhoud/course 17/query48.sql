USE VehicleMakesDB



SELECT TOP 1
    Make, COUNT(*) AS [max number of models]
FROM MakeModels  AS mm JOIN Makes AS m
    ON mm.MakeID = m.MakeID
GROUP BY m.Make
ORDER BY [max number of models] DESC


