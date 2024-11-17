USE VehicleMakesDB



SELECT v.*
FROM VehicleDetails AS v JOIN Bodies AS b
    ON v.BodyID = b.BodyID
WHERE b.BodyName IN('Coupe', 'Hatchback' , 'Sedan')