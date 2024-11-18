USE VehicleMakesDB



--46
SELECT TOP 3
    m.Make, COUNT(*) AS [number of models]
FROM MakeModels  AS mm JOIN Makes AS m
    ON mm.MakeID = m.MakeID
GROUP BY m.Make
ORDER BY [number of models] DESC

-- 47

SELECT TOP 1
    COUNT(*) AS [max number of models]
FROM MakeModels  AS mm JOIN Makes AS m
    ON mm.MakeID = m.MakeID
GROUP BY m.Make
ORDER BY [max number of models] DESC
