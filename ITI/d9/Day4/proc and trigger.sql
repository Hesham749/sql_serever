USE ITI

CREATE TRIGGER t1 ON Instructor
after DELETE
AS
IF (FORMAT( DAY(GETDATE()),'dddd') = 'friday')
BEGIN
    SELECT 'not deleted'
    --  ROLLBACK
    INSERT INTO Instructor
    SELECT *
    FROM deleted
END


CREATE TRIGGER t1 ON Instructor
INSTEAD OF DELETE
AS
IF (FORMAT( DAY(GETDATE()),'dddd') != 'friday')
BEGIN
    DELETE FROM Instructor WHERE Ins_Id IN (SELECT Ins_Id
    FROM deleted)
END


UPDATE Instructor
set Ins_Name = 'Reham'
OUTPUT GETDATE(), deleted.Ins_Name as old , inserted.Ins_Name as new
WHERE Ins_Id =3