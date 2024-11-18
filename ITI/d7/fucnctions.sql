USE ITI
DECLARE @x INT
SELECT @x = 19
SELECT @x


SELECT @@IDENTITY

SELECT @@ROWCOUNT

SELECT @@ERROR

--! save multiple value in variable

DECLARE @t TABLE (x int)
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

IF exists(select *
FROM sys.tables
where name = 'Course')
  SELECT 'table is exist'