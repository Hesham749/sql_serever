USE ITI


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


-- second ex


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