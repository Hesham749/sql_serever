USE ITI


--1
CREATE VIEW vSt
(
    [FULL name] ,
    [course name]
)
AS
    SELECT CONCAT(s.St_Fname , ' ' , s.St_Lname) , c.Crs_Name
    FROM Student AS s JOIN Stud_Course AS sc
        ON sc.St_Id = s.St_Id
        JOIN Course AS c
        ON sc.Crs_Id = c.Crs_Id
    WHERE Grade > 50


SELECT *
FROM vSt

--2
CREATE VIEW vMngrTopic
(
    InstructorName ,
    DepartmentName
)
WITH
    encryption
AS
    SELECT Ins_Name , d.Dept_Name
    FROM Department AS d JOIN Instructor AS i
        ON d.Dept_Manager = i.Ins_Id
    WHERE d.Dept_Name IN ('SD', 'Java')


SELECT *
FROM vMngrTopic


--4

CREATE VIEW v1
AS
    SELECT *
    FROM Student AS s
    WHERE s.St_Address IN('Alex', 'Cairo')
    WITH CHECK OPTION


UPDATE V1 SET st_address='tanta'
WHERE st_address='alex';


--5
USE Company_SD


CREATE VIEW vProEmp
AS

    SELECT p.Pname , COUNT(*) AS [number of Employee]
    FROM Project AS p JOIN Departments AS d
        ON p.Dnum = d.Dnum
        JOIN Employee AS e
        ON e.Dno  = d.Dnum
    GROUP BY p.Pname


SELECT *
FROM vProEmp


--6

CREATE  NONCLUSTERED INDEX s ON Departments
([MGRStart Date])



--7
USE ITI

CREATE NONCLUSTERED INDEX s2 ON student(St_Age)

CREATE  UNIQUE INDEX  s3 on student(St_Age)

SELECT s.
FROM Student AS s


-- 8
