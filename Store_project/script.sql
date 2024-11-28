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
    (1, 1, 1, 1500.00),
    (1, 3, 1, 20.00),
    (2, 2, 1, 800.00);

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
    *
FROM
    Orders