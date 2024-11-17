USE VehicleMakesDB


SELECT * , ([number of vehicles]*1.0 / [total vehicles]*1.0) AS Perc
FROM
    (SELECT m.Make, COUNT(*) AS [number of vehicles] , (select COUNT(*)
        FROM VehicleDetails) AS [total vehicles]
    FROM VehicleDetails AS v JOIN Makes AS m
        ON v.MakeID = m.MakeID
    WHERE [Year] BETWEEN 1950 AND 2000
    GROUP BY Make ) r1
ORDER BY [number of vehicles] desc
