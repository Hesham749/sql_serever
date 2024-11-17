----------------------------------------- DQL ------------------------------------
--------------------------------- 1- SELECT STATMENT -----------------------------

-- without filteration
select * 
from Countries


-- with filteration

select *
from Employees
where Employees.MonthlySalary > 2900

-- with more than one filter
select *
from Employees
where Employees.MonthlySalary > 2900 and Employees.Gender = 'M'


------------------------------------------- projection -----------------------------------

select Employees.ID , Employees.FirstName 
from Employees


----------------------------------------- selection projection ----------------------------
--A selection filtering rows
--B projection columns firstName , MonthlySalary

select Employees.FirstName , Employees.MonthlySalary
from Employees
where Employees.MonthlySalary > 2900

--------------------------------- Rename operation ----------------------------------------

select Employees.FirstName  [First Name] , Employees.LastName  Last_name , Employees.MonthlySalary as Salary , Employees.DateOfBirth 'Birth day'
from Employees 

--- error can't acces alias in where clause
select Employees.FirstName  [First Name] ,  Employees.MonthlySalary as Salary 
from Employees 
where Salary > 2900

------------------------------------- SQL operators ---------------------------------
------------------------------------- 1- Arithmetic operators -----------------------

select *
from Employees
where MonthlySalary + 1000 < 1300

-- add a new custom column from making operation on more than one column 

select Employees.FirstName + ' ' +Employees.LastName as [Full name] , MonthlySalary as Salary
from Employees
where MonthlySalary + 1000 < 1300

-- add a new custom column with constant data
select Employees.FirstName as [First name] , MonthlySalary as Salary , 'Poor' as Status
from Employees
where MonthlySalary + 1000 < 1300

--------------------------------------- SQL comparison operators ----------------------------

select Employees.FirstName as [First name] , MonthlySalary as Salary , Employees.CountryID
from Employees
where Employees.CountryID != 1 and MonthlySalary + 1000 < 1300 

--------------------------------------- SQL logical operators ------------------------------

-- AND

select Employees.FirstName as [First name] , MonthlySalary as Salary , Employees.CountryID
from Employees
where Employees.CountryID != 1 and MonthlySalary + 1000 < 1300 

-- OR

select Employees.FirstName as [First name] , MonthlySalary as Salary , Employees.CountryID
from Employees
where  Employees.CountryID = 1 or NOT CountryID = 3 


-- combine AND and OR 
select Employees.FirstName as [First name] , MonthlySalary as Salary , Employees.CountryID
from Employees
where (Employees.CountryID = 1 or CountryID != 2 ) and MonthlySalary + 1000 < 1300 


