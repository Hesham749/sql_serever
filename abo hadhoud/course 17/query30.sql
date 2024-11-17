USE VehicleMakesDB


SELECT v.Vehicle_Display_Name , NumDoors , CASE when NumDoors =2 then 'tow doors' when NumDoors = 4 then 'four doors' else 'not set' END AS [doors description]
FROM VehicleDetails AS v
