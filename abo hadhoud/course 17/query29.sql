USE VehicleMakesDB


SELECT found = 1
WHERE exists(select *
from VehicleDetails
WHERE [Year] = 1950)
