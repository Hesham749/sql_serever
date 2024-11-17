USE VehicleMakesDB



SELECT DISTINCT m.MakeID , m.Make , s.SubModelName
FROM VehicleDetails AS v JOIN Makes AS m
ON v.MakeID  = m.MakeID JOIN SubModels AS s
ON v.SubModelID = s.SubModelID
WHERE s.SubModelName = 'Elite'