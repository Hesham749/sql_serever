USE ITI


SELECT Ins_Name , COALESCE(cast(Salary as varchar) , 'not found' ) AS salary
FROM Instructor


-- second method
SELECT Ins_Name , ISNULL(cast(Salary as varchar) , 'not found' ) AS salary
FROM Instructor
