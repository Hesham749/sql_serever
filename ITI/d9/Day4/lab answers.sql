USE ITI


--1
CREATE PROC DeptCount
AS
SELECT d.Dept_Name , COUNT(*) numberOfEmployee
FROM Student AS s JOIN Department AS d
    ON s.Dept_Id = d.Dept_Id
GROUP BY d.Dept_Name

DeptCount


--2

USE Company_SD


CREATE FUNCTION getProEmp(@pName NVARCHAR(50))
RETURNS TABLE
RETURN (
SELECT *
FROM Project AS j JOIN Works_for AS wf
    ON wf.Pno = j.Pnumber
    JOIN Employee AS e
    ON wf.ESSn = e.SSN
WHERE j.Pname =@pName
)





CREATE PROC empInProj
    @pName NVARCHAR(50)
AS
DECLARE @empCount INT

SELECT @empCount= COUNT(*)
FROM getProEmp(@pName)
IF @empCount >=3
SELECT 'the number of employees in p1 is 3 or more'
ELSE
BEGIN
    SELECT 'the following Employees work for the project p1'
    SELECT e.Fname , e.Lname
    FROM getProEmp(@pName) AS e
END

empInProj 'Ebad El Rahman'


--3
USE Company_SD


CREATE PROC replaceEmp
    @old INT ,
    @new INT ,
    @pNumber INT
AS

UPDATE wf
SET wf.ESSn = @new
FROM Works_for AS wf
WHERE wf.ESSn = @old AND wf.Pno = @pNumber

IF @@ROWCOUNT = 0
SELECT 'this id does not exists'



replaceEmp
512463, 123456 , 500
