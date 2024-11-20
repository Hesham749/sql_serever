USE ITI


--1
CREATE FUNCTION getMonthName(@d DATE)
RETURNS NVARCHAR
(20)
AS
BEGIN
    RETURN (
 SELECT FORMAT(@d,'MMMM'))
END


--2

CREATE FUNCTION getValuesBetween (@start INT , @end INT)
RETURNS @t TABLE
(number INT)
AS
BEGIN
    WHILE (@start + 1) < @end
BEGIN
        SET @start +=1
        INSERT INTO @t
        VALUES(@start)
    END
    RETURN
END


--3

CREATE FUNCTION getStdDept(@No INT)
RETURNS TABLE
AS

    RETURN
    (SELECT d.Dept_Name , CONCAT(s.St_Fname,' ', s.St_Lname) AS full_name
FROM Student AS s JOIN Department AS d ON s.Dept_Id = d.Dept_Id
WHERE s.St_Id = @No
    )

SELECT *
FROM getStdDept(1)

--4

CREATE FUNCTION whatIsNull(@id INT)
RETURNS NVARCHAR(150)
AS
BEGIN
    RETURN (SELECT CASE WHEN s.St_Fname IS NULL AND s.St_Lname IS NULL THEN 'First name & last name are null'
    WHEN s.St_Fname IS NULL THEN 'first name is null'
    WHEN s.St_Lname IS NULL THEN 'last name is null'
    ELSE 'first name & last name are not null'
    END AS MESSAGE
    FROM Student AS s
    WHERE s.St_Id = @id
)
END

--5

CREATE FUNCTION getMngrDept(@mngrId INT)
RETURNS TABLE
RETURN (
    SELECT mngr.Ins_Name , d.Dept_Name , d.Manager_hiredate
FROM Instructor AS mngr JOIN Department AS d
    ON d.Dept_Manager = mngr.Ins_Id
WHERE mngr.Ins_Id = @mngrId
)

-- 6

CREATE FUNCTION getStName(@nameType VARCHAR(10))
RETURNS @t TABLE (
    result NVARCHAR(50)
)
BEGIN
    IF(@nameType = 'first name')
    INSERT INTO @t
    SELECT ISNULL(s.St_Fname,'')
    FROM Student AS s

    ELSE IF(@nameType = 'last name')
    INSERT INTO @t
    SELECT ISNULL(s.St_Lname,'')
    FROM Student AS s

    ELSE IF(@nameType = 'full name')
    INSERT INTO @t
    SELECT CONCAT( ISNULL(s.St_Fname,'') , ' ' , ISNULL(s.St_Lname,''))
    FROM Student AS s
    RETURN
END

--7

SELECT St_Id , SUBSTRING(St_Fname,1,(LEN(St_Fname)-1)) AS fname
FROM Student


--8

DELETE sc
FROM Stud_Course sc JOIN Student AS s
    ON sc.St_Id = s.St_Id
    JOIN Department AS d
    ON s.Dept_Id = d.Dept_Id
WHERE d.Dept_Name = 'SD'
