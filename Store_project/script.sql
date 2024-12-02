USE Depi_project

-- DDL

CREATE TABLE Customers
(
    CustomerId INT           PRIMARY KEY ,
    FullName   NVARCHAR(50) ,
    Email      NVARCHAR (50),
    Phone      NVARCHAR(11),
    Address    NVARCHAR(100),
    BDay       DATE
)

CREATE TABLE Categories
(
    CategoryId   INT           PRIMARY KEY ,
    CategoryName NVARCHAR (50)
)

CREATE TABLE Products
(
    ProductId   INT          PRIMARY KEY ,
    ProductName NVARCHAR(50),
    CategoryId  INT          FOREIGN KEY REFERENCES Categories(CategoryId),
    Price       DEC(8,2) ,
    Stock       INT
)

CREATE TABLE Orders
(
    OrderId     INT      PRIMARY KEY ,
    CustomerId  INT      FOREIGN KEY REFERENCES Customers(CustomerId),
    OrderDate   DATE ,
    TotalAmount DEC(8,2)
)

CREATE TABLE OrderDetails
(
    OrderId   INT      FOREIGN KEY REFERENCES Orders(OrderId),
    ProductId INT      FOREIGN KEY REFERENCES Products(ProductId),
    Quantity  INT ,
    UnitPrice DEC(8,2),
    PRIMARY KEY(OrderId, ProductId)
)

-- update total amount and unit price

CREATE TRIGGER t1 ON OrderDetails
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO OrderDetails
    SELECT
        i.OrderId ,
        i.ProductId ,
        i.Quantity ,
        ISNULL(i.UnitPrice ,p.Price)
    FROM
        Products AS p JOIN inserted AS i ON p.ProductId = i.ProductId


    --* faster way than next one

    UPDATE o
    SET o.TotalAmount = r1.total
    FROM
        Orders AS o JOIN (SELECT
            od.OrderId ,
            SUM(od.Quantity * od.UnitPrice)  AS total
        FROM
            OrderDetails od
        GROUP BY od.OrderId
        HAVING od.OrderId IN (SELECT
            DISTINCT
            OrderId
        FROM
            inserted)) AS r1
        ON o.OrderId = r1.OrderId

--* slower one


-- UPDATE o
-- SET o.TotalAmount = r1.total
-- FROM
--     Orders AS o JOIN
--     (SELECT
--         o.OrderId ,
--         SUM(od.Quantity * od.UnitPrice) AS total
--     FROM
--         OrderDetails AS od JOIN Orders AS o ON od.OrderId = o.OrderId
--     GROUP BY o.OrderId) AS r1
--     ON o.OrderId = r1.OrderId

END


--DML

INSERT INTO Categories
    (CategoryId, CategoryName)
VALUES
    (1, 'toys'),
    (2, 'Books'),
    (3, 'Clothing');

GO

INSERT INTO Products
    (ProductId, ProductName, CategoryId, Price, Stock)
VALUES
    (1, 'Laptop', 1, 1500.00, 10),
    (2, 'Smartphone', 1, 800.00, 20),
    (3, 'T-shirt', 2, 20.00, 50),
    (4, 'Novel', 3, 15.00, 0);

GO

INSERT INTO Customers
    (CustomerId, FullName, Email, Phone, Address, BDay)
VALUES
    (1, 'Eman Ashraf', 'eman@example.com', '0123456789', 'Cairo, Egypt', '2003-08-15'),
    (2, 'mariam ali', 'mariam@example.com', '0112233445', 'Giza, Egypt', '1985-05-10'),
    (3, 'Hesham Elsayed', 'Hesham@example.com', '0109876543', 'Alexandria, Egypt', '2000-11-25');

GO

INSERT INTO Orders
    (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES
    (1, 1, '2024-11-01', 1520.00),
    (2, 2, '2024-11-02', 800.00);

GO

INSERT INTO OrderDetails
    (OrderId, ProductId, Quantity, UnitPrice)
VALUES
    (1, 1, 15, 10.00),
    (1, 3, 10, NULL),
    (2, 2, 1, 80.00);


INSERT INTO OrderDetails
    (OrderId, ProductId, Quantity)
VALUES
    (1, 2, 2)



-- DML

--3
SELECT
    *
FROM
    Customers

--4
SELECT
    *
FROM
    Products
WHERE Price > 500

--5

SELECT
    od.*
FROM
    OrderDetails AS od JOIN Orders AS o
    ON o.OrderId = od.OrderId
WHERE CustomerId = 3


--6
SELECT
    * ,
    CASE WHEN Stock =0 THEN 'Out of Stock' WHEN Stock <20 THEN 'Low Stock' WHEN Stock >= 20 THEN 'In Stock' END AS STATUS
FROM
    Products

--7

SELECT
    OrderId ,
    SUM(TotalAmount) AS totalSales
FROM
    Orders
GROUP BY OrderId


--8

CREATE VIEW vProductCat
AS
    SELECT
        p.* ,
        c.CategoryName
    FROM
        Products AS p JOIN Categories AS c
        ON p.CategoryId = c.CategoryId


SELECT
    *
FROM
    vProductCat


-- 9

CREATE NONCLUSTERED INDEX x1 ON Orders(OrderDate)

--10

CREATE PROC sp_getOrder
    @id INT
AS
SELECT
    *
FROM
    Orders AS o
WHERE o.OrderId = @id

sp_getOrder 1


--11

CREATE FUNCTION CalcTotal(@order INT)
RETURNS DEC(8,2)
AS
BEGIN
    RETURN
(SELECT
        SUM(TotalAmount)
    FROM
        Orders
    GROUP BY OrderId
    HAVING OrderId =@order
    )
END


SELECT
    dbo.CalcTotal(2) AS total

--12

DECLARE c1 CURSOR
FOR
SELECT
    Email
FROM
    Customers
FOR
READ
ONLY
DECLARE @mail NVARCHAR(50)
OPEN c1
FETCH c1 INTO @mail
WHILE @@FETCH_STATUS =0
BEGIN
    SELECT
        @mail
    FETCH c1 INTO @mail
END
CLOSE c1
DEALLOCATE c1


--13

CREATE TRIGGER t2 ON OrderDetails after INSERT
AS

    DECLARE @Quantity INT = (SELECT
    sum(Quantity)
FROM
    inserted
GROUP BY ProductId
HAVING ProductId = 1)

    IF @Quantity > 0
BEGIN
    UPDATE p
    SET p.Stock -= @Quantity
    FROM
        Products AS p
    WHERE ProductId =1
END




INSERT INTO OrderDetails
    (OrderId, ProductId, Quantity, UnitPrice)
VALUES
    (3, 1, 3, 1500.00),
    (2, 3, 3, 1500.00)


--14

DELETE Orders
WHERE OrderId = 3

--15

TRUNCATE  TABLE Categories

GO

INSERT INTO Categories
    (CategoryId, CategoryName)
VALUES
    (1, 'toys'),
    (2, 'Books'),
    (3, 'Clothing');


--16

ALTER TABLE Customers
ADD Bday DATE


--17

ALTER TABLE customers
ADD Age AS (DATEDIFF(YEAR,BDay,GETDATE()))


--18

SELECT
    *
FROM
    Orders AS o
WHERE DATEDIFF(DAY, o.OrderDate,GETDATE()) <= 7


--19

SELECT
    TOP 1
    *
FROM
    Products AS p
ORDER BY p.Price


--20

SELECT
    c.Address,
    COUNT(*) AS [number of customers]
FROM
    Customers AS c
GROUP BY c.Address


--21

SELECT
    o.* ,
    p.ProductName
FROM
    Orders AS o JOIN OrderDetails AS od ON od.OrderId = o.OrderId
    JOIN Products AS p ON od.ProductId = p.ProductId

--22

SELECT
    *
FROM
    Products AS p LEFT JOIN Categories AS c ON p.CategoryId = c.CategoryId

--23

SELECT
    *
FROM
    Customers AS c LEFT JOIN Orders AS o ON o.CustomerId = c.CustomerId


--24


SELECT
    p.*
FROM
    Products AS p JOIN (SELECT
        * ,
        DENSE_RANK()OVER(ORDER BY p.Price DESC) AS dr
    FROM
        Products AS p) AS pr
    ON p.ProductId = pr.ProductId
WHERE pr.dr = 2


--25

SELECT
    SUM(TotalAmount) AS revenue
FROM
    Orders AS o

--26


SELECT
    *
FROM
    Products AS p JOIN OrderDetails AS od
    ON od.ProductId = p.ProductId
WHERE p.Stock < od.Quantity


-- 27

UPDATE p
    SET p.Price -= p.Price * 0.10
FROM
    Products AS p
WHERE Stock >= 20


--28

SELECT
    *,
    CASE WHEN TotalAmount >= 1000 THEN 'High Value' WHEN TotalAmount BETWEEN 500 AND 999 THEN 'Medium Value' ELSE 'LowValue' END categorize
FROM
    Orders AS o


--29

CREATE VIEW vOrdersProduct
AS
    SELECT
        o.* ,
        p.*
    FROM
        Orders AS o JOIN OrderDetails AS od
        ON od.OrderId = o.OrderId JOIN Products AS p
        ON od.ProductId = p.ProductId

SELECT
    *
FROM
    vOrdersProduct


--30

CREATE NONCLUSTERED INDEX  i2 ON Customers(Email)


--31

CREATE PROC sp_getProductsInRange
    @start DEC(8,2) ,
    @end DEC
(8,2)
AS
SELECT
    *
FROM
    Products AS p
WHERE p.Price  BETWEEN @start AND @end


EXEC sp_getInRange 10,80


--32

CREATE FUNCTION GetOrderTotal(@id INT)
RETURNS DEC(8,2)
BEGIN
    RETURN (SELECT
        o.TotalAmount
    FROM
        Orders AS o
    WHERE o.OrderId = @id
        )
END


SELECT
    dbo.GetOrderTotal(2)


--33


DECLARE @Quantity INT =2 , @ProductId INT = 100
BEGIN TRY
BEGIN TRANSACTION

UPDATE Products
SET Stock -= @Quantity
WHERE ProductId = @ProductId

INSERT INTO OrderDetails
    (OrderId , ProductId , Quantity )
VALUES
    (3, @ProductId , @Quantity)
COMMIT
end TRY
BEGIN CATCH
 ROLLBACK
 SELECT
    'Action terminated'
end CATCH

--34
USE Depi_project


CREATE TRIGGER t3 ON OrderDetails
after INSERT
AS
BEGIN
    UPDATE p
    SET p.Stock -= i.Quantity
    FROM
        inserted AS i JOIN Products AS p
        ON i.ProductId = p.ProductId
END


--35

BEGIN TRY
BEGIN TRANSACTION
INSERT INTO Orders
    (OrderId ,CustomerId , OrderDate)
VALUES
    (4, 1, GETDATE())


UPDATE Products
SET Stock -=3
WHERE ProductId =2

INSERT INTO OrderDetails(OrderId, ProductId,Quantity)
VALUES
    (5, 2, 3)

COMMIT
END TRY
BEGIN CATCH
ROLLBACK
end CATCH


