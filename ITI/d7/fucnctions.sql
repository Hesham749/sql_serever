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

--! functions

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

--! windowing functions

-- LAG()   ==> get the previous record based on the order by
--* it takes mandatory parameter is what column will show and optional column that how many prev will be

SELECT * , LAG(Ins_Name)OVER(ORDER BY salary) AS prev
FROM Instructor AS i


-- LEAD()   ==> get the next record based on the order by
--* it takes mandatory parameter is what column will show and optional column that how many next will be

SELECT * , LEAD(Salary,2)OVER(ORDER BY salary) AS NEXT
FROM Instructor AS i


-- FIRST_VALUE()

SELECT * , FIRST_VALUE(Salary)OVER(ORDER BY salary) AS FIRST
FROM Instructor AS i

-- LAST_VALUE()
--* to get the right value of the last_value you must add the ***(range between current row and unbounded following)***
SELECT * , LAST_VALUE(Salary)
OVER(  ORDER BY salary RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS LAST
FROM Instructor AS i