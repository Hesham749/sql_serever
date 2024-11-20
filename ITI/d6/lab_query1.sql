USE SD


CREATE RULE r1 AS @x IN('NY','DS','KW')

CREATE DEFAULT d1 AS  'NY'

sp_addtype loc , 'nchar(2)'


sp_bindrule r1 , loc
sp_bindefault d1 , loc

CREATE TABLE Department
(
    DeptNo NVARCHAR(10) PRIMARY KEY ,
    DeptName NVARCHAR(50),
    Location LOC
)


INSERT INTO Department
    (DeptNo,DeptName)
VALUES
    ('d1', 'Research' )

INSERT INTO Department
VALUES
    ('d2', 'Accounting', 'DS'),
    ('d3', 'Markting', 'KW')

CREATE TABLE Employee
(
    EmpNo INT PRIMARY KEY ,
    EmpFname NVARCHAR(50) NOT NULL,
    EmpLname NVARCHAR(50) NOT NULL,
    DeptNo NVARCHAR(10) FOREIGN KEY REFERENCES Department(DeptNo),
    Salary INT UNIQUE
)

CREATE RULE r2 AS @x < 6000

sp_bindrule r2 , 'Employee.Salary'

INSERT INTO Employee
VALUES
    (25348 , 'Mathew'	 , 'Smith'	 , 'd3'	 , 2500),
    (10102 , 'Ann' , 'Jones' , 'd3'	 , 3000)


CREATE SCHEMA Company
;
CREATE SCHEMA Human
;

ALTER SCHEMA Company transfer dbo.Department;
ALTER SCHEMA [Human Resource] transfer dbo.Employee ;

ALTER SCHEMA [Human Resource] transfer Human.Employee

CREATE SYNONYM Emp FOR [Human Resource].Employee



--3
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='Employee';


--4
SELECT *
FROM Employee
SELECT *
FROM [Human Resource].Employee
SELECT *
FROM Emp
SELECT *
FROM [Human Resource].Emp


--5

UPDATE p
SET  p.Budget *=1.10
    FROM Works_on AS w JOIN sd.Company.Project AS p
    ON w.ProjectNo = p.ProjectNo
    WHERE w.EmpNo = 10102 AND Job = 'Manager'

SELECT *
FROM Company.Project


--6

UPDATE d
SET d.DeptName = 'Sales'
FROM [Human Resource].Employee AS e JOIN Company.Department AS d
    ON e.DeptNo = d.DeptNo
WHERE e.EmpFname = 'james'

--7

UPDATE w
SET w.Enter_Date = '2007.12.12'
FROM [Human Resource].Employee AS e JOIN Works_on AS w
    ON w.EmpNo = e.EmpNo
    JOIN Company.Department AS d
    ON e.DeptNo = d.DeptNo
WHERE d.DeptName = 'Sales' AND w.ProjectNo = 'p1'


-- 8

DELETE w
FROM Works_on
AS w JOIN [Human Resource].Employee AS e
    ON w.EmpNo = e.EmpNo
    JOIN Company.Department AS d
    ON e.DeptNo = d.DeptNo
WHERE d.[Location] = 'KW'


