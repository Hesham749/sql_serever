USE e_ommerce_lab4


BEGIN TRY
BEGIN TRANSACTION
INSERT INTO OrderDetails
    (OrderID , ProductID)
VALUES
    (1, 3)
INSERT INTO OrderDetails
    (OrderID , ProductID)
VALUES
    (1, 1)

    COMMIT
END TRY
BEGIN catch
    ROLLBACK
END CATCH

CREATE TABLE person
(
    id  int PRIMARY KEY,
    email NVARCHAR(50)
)

INSERT INTO person
VALUES
    (4, 'bob@example.com '),
    (5, 'john@example.com'),
    (6, 'john@example.com'),
    (7, 'hesham@example.com')



SELECT *
from person
where email in (
select email
    from person
    group by email
    having count(*) > 1) and id not in (select min(id)
    from person
    group by email)


SELECT *
FROM person
ORDER BY NEWID()



--! Ranking Functions

-- Row_Number()
-- Dense_Rank() with duplicated
-- NTiles( number of Groups)
-- Rank()

SELECT  *
FROM
    (select * , ROW_NUMBER() OVER (order by salary desc) AS rn, DENSE_RANK() OVER(order by salary desc) AS dr

    from Company_SD.dbo.Employee) AS newTable

WHERE dr =2
