USE VehicleMakesDB



SELECT Make , [number of models]
FROM (SELECT
        Make, COUNT(*) AS [number of models] , DENSE_RANK() OVER (ORDER BY count(*) ASC) AS dr
    FROM MakeModels  AS mm JOIN Makes AS m
        ON mm.MakeID = m.MakeID
    GROUP BY m.Make)r1
WHERE dr =1