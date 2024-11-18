USE VehicleMakesDB

SELECT v.Vehicle_Display_Name , [Year] , (SELECT YEAR(GETDATE()) -[Year]) AS age
FROM VehicleDetails AS V
ORDER BY age DESC