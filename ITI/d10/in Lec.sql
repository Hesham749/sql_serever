USE ITI



--!         Cursor

--1
DECLARE c1 CURSOR
FOR SELECT
    St_Id ,
    St_Fname
FROM
    Student
FOR
READ
ONLY
-- update is the default
DECLARE @id INT , @name VARCHAR(20)
OPEN c1
FETCH c1
INTO @id , @name
WHILE @@FETCH_STATUS =0
BEGIN
    SELECT
        @id ,
        @name
    FETCH c1 INTO @id , @name
END
CLOSE c1
DEALLOCATE c1




-- 2

DECLARE c1 CURSOR
 FOR
 SELECT
    St_Fname
FROM
    Student
WHERE St_Fname IS NOT NULL
FOR
READ
only
DECLARE @name VARCHAR (20) , @allNames VARCHAR(max) =''
OPEN c1
FETCH c1 INTO @name
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @allNames = CONCAT(@allNames , ',',@name)
    FETCH c1 INTO @name
END
SELECT
    @allNames
CLOSE c1
DEALLOCATE c1


--3

DECLARE c1 CURSOR
FOR
SELECT
    Salary
FROM
    Instructor
FOR
UPDATE
DECLARE @sal INT
OPEN c1
FETCH c1 INTO @sal
WHILE @@FETCH_STATUS =0
BEGIN
    IF
  @sal >= 3000
        UPDATE Instructor
  SET Salary = @sal * 1.20
  WHERE CURRENT OF c1

    FETCH c1 INTO @sal
END
CLOSE c1
DEALLOCATE c1


--4

DECLARE c1 CURSOR
FOR
SELECT
    Ins_Name
FROM
    Instructor
FOR
READ
ONLY
DECLARE @name NVARCHAR(50) , @counter INT =0 , @prevName NVARCHAR (50) =''
OPEN c1
FETCH c1 INTO @name
WHILE @@FETCH_STATUS =0
BEGIN
    IF @name = 'Amr' AND @prevName ='Ahmed'
    SET @counter +=1
    SET @prevName = @name
    FETCH c1 INTO @name
END
SELECT
    @counter
CLOSE c1
DEALLOCATE c1


-- other method

DECLARE c1 CURSOR
FOR
SELECT
    Ins_Name
FROM
    Instructor
FOR
READ
ONLY
DECLARE @name NVARCHAR(50) , @counter INT =0 , @flag INT = 0
OPEN c1
FETCH c1 INTO @name
WHILE @@FETCH_STATUS =0
BEGIN
    IF @name = 'Ahmed'
            SET @flag = 1
    ELSE IF @name = 'Amr' AND @flag =1
        SET @counter +=1
    ELSE
        SET @flag = 0
    FETCH c1 INTO @name
END
SELECT
    @counter
CLOSE c1
DEALLOCATE c1


--*<=====================================================================================================================>
