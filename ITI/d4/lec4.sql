SELECT sum(salary) , Dept_Id
FROM Instructor
GROUP BY Dept_Id


SELECT SUM(i.Salary) , i.Dept_Id , d.dept_name
FROM Instructor as i , Department as d
WHERE i.Dept_Id = d.Dept_Id
GROUP BY i.Dept_Id , d.Dept_Name

SELECT salary
FROM Instructor

-----------
    SELECT St_Fname as names
    FROM Student
UNION ALL
    SELECT Ins_Name
    FROM Instructor

-- distincit
    SELECT St_Fname as names
    FROM Student
UNION
    SELECT Ins_Name
    FROM Instructor



    SELECT St_Fname as names
    FROM Student
EXCEPT
    SELECT Ins_Name
    FROM Instructor



-- the matching in the two tables
    SELECT St_Fname as names
    FROM Student
INTERSECT
    SELECT Ins_Name
    FROM Instructor

--! built in function

SELECT DB_NAME()
GO
SELECT SUSER_NAME()
