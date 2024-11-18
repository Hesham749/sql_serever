USE VehicleMakesDB

SELECT *
FROM
    (
SELECT v.Vehicle_Display_Name , [Year] , (SELECT YEAR(GETDATE()) -[Year]) AS age
    FROM VehicleDetails AS V
    )r1
WHERE r1.age BETWEEN 15 AND 25
ORDER BY age DESC