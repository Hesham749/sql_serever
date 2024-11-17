USE ITI


-- 1
SELECT COUNT(St_Age)
FROM Student

SELECT *
FROM Student

--2
SELECT distinct Ins_Name
FROM Instructor

--3

SELECT ISNULL(St_Id,'no date') AS [student ID] , CONCAT(ISNULL(St_Fname,'') , ' ',ISNULL(St_Lname,'')) AS [student full name] , ISNULL( d.Dept_Name,'no data') AS [Department name]
FROM Student , Department AS d
WHERE Student.Dept_Id = d.Dept_Id


--4
SELECT i.Ins_Name , d.Dept_Name
FROM Instructor AS i LEFT JOIN Department AS d
    ON i.Dept_Id = d.Dept_Id

--5
SELECT CONCAT(s.St_Fname,' ' , s.St_Lname) AS [full name] , c.Crs_Name , sc.Grade
FROM Student AS s , Stud_Course AS sc , Course AS c
WHERE sc.St_Id = s.St_Id AND sc.Crs_Id = c.Crs_Id AND sc.Grade IS NOT NULL

--6
SELECT t.Top_Name , COUNT(Crs_Id) AS [number of Course]
FROM Course AS c , Topic as t
WHERE c.Top_Id = t.Top_Id
GROUP BY t.Top_Name

--7
SELECT CONVERT(decimal(10,0),MAX(Salary))  AS maxSalary ,CONVERT(decimal(10,0),min(Salary)) AS MinSalary
FROM Instructor

--8
