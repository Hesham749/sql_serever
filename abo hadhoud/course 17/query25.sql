USE VehicleMakesDB



SELECT m.Make , v.*
FROM VehicleDetails AS v JOIN Makes AS m
ON v.MakeID = m.MakeID
WHERE v.Engine LIKE '%OHV%' AND v.Engine_Cylinders =4