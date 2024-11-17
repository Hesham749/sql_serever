-------------------------------- order the output ------------------------
-- asc by default
select * 
from Employee
order by Salary 

-- desc
select * 
from Employee
order by Salary desc

select Employee.Fname as [Name] , Employee.Salary
from Employee
where Dno =10
order by Salary desc

-- you can order by alias name beacause it proceeded after projection 

select Employee.Fname as [Name] , Employee.Salary
from Employee
where Dno =10
order by [Name] desc

-- order by more than one input
select * 
from Employee
order by Salary desc , Fname asc

-------------------------------------------- select unique --------------------------

select Lname 
from Employee

select distinct  Lname
from Employee

select distinct Lname , Salary
from Employee

-----------------------------------------------------------------------------------------
------------------------------------- Aggregation Functions -----------------------------

-- max
select MAX(Salary) as [max salary]
from Employee

-- with filteration
select min(Salary) as [min salary]
from Employee 
where Dno = 10

select avg(Salary) as [average salary]
from Employee

-- count the number of rows and don't count null 
select COUNT(R1.Dno) 
from (select distinct dno from Employee) as R1

select min(Salary) as [min salary] ,  MAX(Salary) as [max salary] , avg(Salary) as [average salary]
from Employee
where Sex = 'F'

--------------------------------------------------------------------------------------
------------------------------------ grouping ----------------------------------------

-- error can't add column you don't gruop by it with aggregate function
select dno ,  MAX(Salary)
from Employee


select dno ,  MAX(Salary) as [maximum salary] ,  avg(Salary) as [average salary]
from Employee
group by dno


select dno
from Employee
group by dno

-- error 

select dno , Fname
from Employee
group by dno


-- group and use (count) aggregate function

select  Salary , count(Fname) as number_of_employee
from Employee
group by Salary 

select sex , COUNT(*) as number_of_employee
from Employee
group by sex

--------------------------------------- grouping by more than one clolumn-------------------------

select  sex  , dno, max(Salary) as [Max salary]
from Employee
group by  Sex , dno


select dno  , sex , COUNT(*) as [number of employee]
from Employee
group by dno , Sex
order by dno

--------------------------------------- grouping with filtering ------------------------------------

select Dno  , sex , COUNT(*) as [number of employee]
from Employee
where Dno != 10
group by dno , Sex
order by dno

select Dno  , sex , COUNT(*) as [number of employee]
from Employee
group by dno , Sex
having Dno != 10
order by dno

select dno   , COUNT(*) as [number of employee]
from Employee
group by dno 
having COUNT(*) < 4 and MAX(Salary) > 1500
order by dno

---------------------------------------------------------------------------------------------
------------------------------------- nested queries ----------------------------------------  

select Dname
from Departments
where Dnum = (
select dno
from Employee
where Employee.SSN = 112233
)

-- we use in if we exepect more than one value 
select Dname
from Departments
where Dnum in (
select dno
from Employee
where Sex = 'F'
)


select Fname , Salary , dno from Employee 
where Salary > (select  MAX(Salary) from Employee 
				where Dno = 20 )


-- Use the IN operator in a WHERE clause to compare a value with any of the values in a list
select Dname from Departments
where Dnum in (select Dno from Employee
				where salary = (select MAX(Salary) from Employee  ) )  

 -- You must place an =, <>, <, >, <=, or >= operator before ANY and ALL.

-- using any its like min
select Fname , Salary , dno from Employee 
where Salary > any (select  Salary from Employee 
				where Dno = 20 )

-- using all its like max
select Fname , Salary , dno from Employee 
where Salary > all (select  Salary from Employee 
				where Dno = 20 )

-------------------------------------------- binary relation operation -------------------------------
-------------------------------------------- 1- cartesian product ------------------------------------

-- first syntax
select *
from Employee , Departments
order by Fname

-- cross join syntax
select emp.Fname , emp.Lname , dep.Dnum , Dname 
from Employee as emp cross join Departments as dep
order by Fname

------------------------- selection fitering ---------------------------

select emp.Fname , emp.Lname , emp.Salary , dep.Dnum , Dname 
from Employee as emp cross join Departments as dep
where emp.Salary > 1000 and dep.Dname = 'Dp1'
order by Fname

------------------------------------------- 2- inner join -----------------------------------
-- get the correct data of join

select * 
from Employee as emp cross join Departments as dep
where emp.Dno = dep.Dnum


-- using inner join 

select Fname , Salary , Dname
from Employee inner join Departments
on Employee.Dno = Departments.Dnum
where Salary > 1000

select Fname , Dname
from Employee inner join Departments
on Dno = Dnum

select Fname as employee , [Dependent].Dependent_name 
from Employee inner join [Dependent]
on Employee.SSN = [Dependent].ESSN



select Project.Pname , Departments.Dname
from Project inner join Departments
on Project.Dnum = Departments.Dnum



--------------------------------------------


select Pname , Dname
from Project inner join Departments
on Project.Dnum =  Departments.Dnum
where project.Pnumber = any (select Pno
				from Works_for
				where ESSn in (select SSN
							from Employee
							where Fname = 'Maged' and Lname = 'Raoof'))



----------------------------- inner join between multiple table --------------------------------------

select emp.Fname , p.Pname , Departments.Dname
from Employee as emp inner join Works_for as wf
on wf.ESSn = emp.SSN inner join Project as p
on p.Pnumber = wf.Pno inner join Departments
on Departments.Dnum = emp.Dno

-------------------------------------------------------------------------------------------------------
--------------------------------- outer join ---------------------------------------------------------

select *
from Employee right join Departments 
on Employee.Dno = Dnum

select *
from Employee right join Departments 
on Employee.Dno = Dnum

select *
from Employee full outer join Departments 
on Employee.Dno = Dnum

---------------------------------- self join -------------------------------------------------

select employee.Fname , employee.Lname , employee.Superssn , super.Fname , super.SSN
from Employee inner join Employee as super
on Employee.Superssn = super.SSN

------------------------------------ select number of rows -------------------------------------

select top 3 * from Employee

select top 3 * from Employee
order by Fname desc


----------------------------------------- searching for string -----------------------------------

select * 
from Employee
where Fname like '%l' -- end with 

select * 
from Employee
where Fname like 'n%' -- start with 

select * 
from Employee
where Fname like '%a_' -- before end  

select * 
from Employee
where Fname like '__r%'

select * 
from Employee
where Fname like '_[aed]%'


select * 
from Employee
where Fname like '_[_]%'  -- special character

select * 
from Employee
where Fname like '_[a-c]%'  -- range