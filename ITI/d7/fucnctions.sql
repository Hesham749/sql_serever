USE ITI
DECLARE @x INT
SELECT @x = 19
SELECT @x


SELECT @@IDENTITY

SELECT @@ROWCOUNT

SELECT @@ERROR

--! save multiple value in variable

DECLARE @t TABLE (x INT)
INSERT INTO @t
SELECT Ins_Id
FROM Instructor

SELECT *
FROM @t


--! control of flow

-- if
-- BEGIN
-- END
-- IF exists    IF not exists
-- WHILE
-- CONTINUE
-- BREAK
-- CASE
-- IIF
-- WAITFOR
-- CHOOSE

IF EXISTS(SELECT name
FROM sys.tables
WHERE name = 'Course')
  SELECT 'table is exist'




SELECT TOP(1)
  i.Ins_Name
FROM Instructor AS i
ORDER BY LEN( i.Ins_Name) DESC



-- scalar function
CREATE FUNCTION getIName(@id INT)
RETURNS VARCHAR(50)
BEGIN
  RETURN(SELECT i.Ins_Name
  FROM Instructor AS i
  WHERE i.Ins_Id = @id)
END

SELECT dbo.getIName(2)



-- multiline function
CREATE FUNCTION GetIns(@did INT)
 RETURNS TABLE
 RETURN(SELECT *
FROM Instructor
WHERE Dept_Id = @did)

SELECT *
FROM GetIns(20)


-- multi statement function

CREATE  FUNCTION getStd(@format VARCHAR(20))
RETURNS @t TABLE
(
  id INT ,
  ename VARCHAR(20)
)
BEGIN
  IF @format ='first'
    INSERT INTO @t
  SELECT st_id , St_Fname
  FROM Student

  ELSE IF @format = 'last'
     INSERT INTO @t
  SELECT St_Id , St_Lname
  FROM Student
  RETURN
END

SELECT *
FROM getStd('last')