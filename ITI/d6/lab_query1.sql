USE SD


CREATE RULE r1 AS @x in('NY','DS','KW')

CREATE DEFAULT d1 AS  'NY'

sp_addtype loc , 'nchar(2)'


sp_bindrule r1 , loc
sp_bindefault d1 , loc

CREATE TABLE Department
(
    DeptNo NVARCHAR(10) PRIMARY KEY ,
    DeptName NVARCHAR(50),
    Location loc
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


