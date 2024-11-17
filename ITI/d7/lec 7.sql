
declare @x int
select @x =100
select @x

declare @y int = 500
select @y

alter schema dbo transfer itistud.student

declare @x int = (select avg(st_age) from student)
select @x

declare @x int = 100
select @x = (select st_age from student)  --error
select @x


declare @x int
select @x = (select st_age from student where st_id =2)
select @x

declare @x int
select @x = (select st_age from student where st_id =22000)
select @x         --NULL

declare @x int =100
select @x = (select st_age from student where st_id =22000)
select @x   --NULL
 
declare @x int, @name varchar(20)
select @x = st_age, @name = st_fname from student 
select @x, @name   --mn 3'er where byrg3 a5r return w by7oto fel variable


declare @x int, @name varchar(20)
select @x = st_age, @name = st_fname from student where st_id = 7
select @x, @name   -

--gomlt update w select lel variable fe nfs el wa2t

declare @z varchar(20)
update student 
set st_fname = 'ali',@z= st_lname where st_id = 8
select @z

--variableof table data type
declare @t table (x int, y varchar(20))
insert into @t
select st_id, st_fname from student 
select * from @t


--can use top statement with variable 

declare @t int = 5
select top(@t) *
from Student


select * from student 
--could be ??
declare @col varchar(20) = '*', @tab varchar(20) = 'student'
select @col from @tab
--error 3lshan el @tab da variable mn no3 string, must be variable mn no3 table.

declare @col varchar(20)='*', @tab varchar(20)='student'
execute ('select '+@col+'from '+@tab) 

-------------------------------------------------
--global variable

select @@SERVERNAME
select @@VERSION

update student 
set st_age+=1
select @@ROWCOUNT
select @@ROWCOUNT

select * from stud 
go
select @@ERROR


select @@IDENTITY
---------------------------------------------------------
--control of flow statement
--if
declare @x int 
update student 
set st_age+=1
select @x = @@ROWCOUNT
if @x >0
	begin
		select 'multi rows affected'
	end
else 
	begin
		select 'no rows affected'
	end

	}


--begin
--end
--if exists if not exists
--msh mohtam bel nateg ana bs mohtm fe nateg wla la2 
if exists (select name from sys.tables where name ='student')
	select 'table exists'
else	
	create table student
	(
	id int,
	name nvarchar(20)
	)

	--mmkn nhandelbeha errors zy keda 
	--lw fe relation wna ba7awel ams7 el parent
--error	--delete from Department where Dept_Id = 20
if not exists (select Dept_Id from student where dept_id = 20) and not exists (select dept_id from Instructor where dept_id =20)
		begin
		delete from Department where dept_id =20
		end
else
select 'related not delted'


--mmkn tt3ml b try w catch 

begin try 
	delete from Department where dept_id =20
end try
begin catch 
	select'error'
	select ERROR_LINE(), ERROR_NUMBER(), ERROR_MESSAGE()
end catch

---------------------------------------
--loops
--while only 
declare @x int =10
while @x <=20
begin
	set @x+=1
	if @x=14
		continue
	if @x=16
	break
	select @x
end--11-12-13-15

--continue btrg3ny ll loop tany 
--break bt5rgny bara el loop 
--iif 
--IIF(condition, value_if_true, value_if_false)
select IIF(count(dept_id)<20, 'true =less', 'false =more')
from Department

--wait for

--Blocks the execution of a batch, stored procedure, or transaction until either a specified time or time interval elapses, or a specified statement modifies or returns at least one row.


--case 
--he CASE command is used is to create different output based on conditions.
--ex
--SELECT OrderID, Quantity,
--CASE
--    WHEN Quantity > 30 THEN "The quantity is greater than 30"
--    WHEN Quantity = 30 THEN "The quantity is 30"
--    ELSE "The quantity is under 30"
--END
--FROM OrderDetails;
-------------
--another ex
--SELECT CustomerName, City, Country
--FROM Customers
--ORDER BY
--(CASE
--    WHEN City IS NULL THEN Country
--    ELSE City
--END);
---------------------------------------
--choose
--https://www.sqlservertutorial.net/sql-server-system-functions/sql-server-choose-function/

select * from sys.tables


------------------------------------
--batch 
/*set of querries hytnfzo sawa, w kol wa7d fehom msh hy2sr 3la l tany 3ady 
w lw fe wa7d fehom error 3ady hykml el ba2y*/
create table parent (id int primary key)
create table child (fid int foreign key references parent(id))

--as a batch, u can run these 3 rows at once 

insert into parent (id) values (1)
insert into parent (id) values (2)
insert into parent (id) values (3)

--as a batch, u can run these 3 rows at once 
/*
1 row affected 
foreign key constraint error 
1 row affected 
-- by3aml kol satr lw7do (da hwa el batch)*/
insert into child (fid) values (1)
insert into child (fid) values (4)
insert into child (fid) values (3)
---------------------------------------------------
--SCRIPT
--zy el batch lkn commonly bykon m3el ddl 
--ykon fe 2 querries msh hynf3 ysht3'lo m3 b3d w bfsl benhom b  go 
zy msln 
create table temp (id int)
go
drop table temp

create rule r10
go
sp_bindrule r10
----------------------------------------------
--tranasction 
/*set of querrirs works as one unit of work, ya yusht3'lo kollohom sawa ya wla wa7d fehom ysht3'l*/
begin transaction
	insert into child (fid) values (1)
	insert into child (fid) values (4)
	insert into child (fid) values (3)
commit -- keda k2nha batch 1 row aff, error, 1 row aff

begin transaction
	insert into child (fid) values (1)
	insert into child (fid) values (2)
	insert into child (fid) values (3)
rollback -- keda wla k2ny ktbt 7aga kolhom hytms7o sa7 aw 3'lt 7ata lw kolhom sa7
truncate table child

select * from child
--u should take care to use commit or roll back 
--try catch klogic is the best fit for this situation 

begin try 
	begin transaction
		insert into child (fid) values (1)
		insert into child (fid) values (2)
		insert into child (fid) values (3)
	commit
end try
begin catch
	rollback
end catch
---------------------------------------------
--User defined functions 
--3 type 
	--scalar function (returns scalar value)
	--inline table function (returns table and no logic statemnet, Just SELECT STATEMENTS)
	--multi statement table valued function (returns table, select + logic statements "if, looping, declaring").


	--SCALAR FUNCTION 
create function FirstName (@id int)
returns varchar(20) 
begin
	declare @name varchar(20)
	select @name= St_Fname from Student where St_Id = @id
	return @name
end 

select dbo.FirstName(2)
---------------------------------------------
	-- INLINE FUNCTION 
create function GetInstructor (@did int)
returns table
as
	return
	(
		select Ins_Name, Salary *12 as Yearsalary from instructor
		where dept_id = @did
	)

	--in call bt3aml m3ah  k2nha table l2nha bt return table 
select * from GetInstructor(10)
--------------------------------------------------------
	--MULTI STATEMENT FUNCTION
create function GetStudent (@format varchar(20))
returns @t table 
	(
		id int,
		studentName varchar(20)
	)
as
	begin
	
		if @format = 'first'
		--insert based on select
			insert into @t 
			select St_Id,St_Fname from Student
		else if @format = 'last'
			insert into @t
			select St_Id,St_Lname from Student
		else if @format = 'full'
			insert into @t
			select St_Id,St_Fname+' '+St_Lname from Student
		return
	end

--call
	select * from getstudent ('FULL')

--------------------------------------------------------------------

	--WINDOWING FUNCTIONS 
--LEAD  el value elle b3dy 
--Lag el value elle 2bly 

select St_Fname, Grade,
x = lag(st_fname) over (order by grade),
y = lead(st_fname) over (order by grade)
from Stud_Course inner join Student on student.St_Id = Stud_Course.St_Id


select St_Fname, Grade,
x = lag(st_fname) over (partition by crs_id order by grade),
y = lead(st_fname) over (partition by crs_id  order by grade)
from Stud_Course inner join Student on student.St_Id = Stud_Course.St_Id

select St_Fname, Grade, crs_id,
x = lag(st_fname) over ( order by grade),
y = lead(st_fname) over (order by grade),
first = FIRST_VALUE(st_fname) over ( order by grade),
last = LAST_VALUE(st_fname) over (order by grade)
from Stud_Course inner join Student on student.St_Id = Stud_Course.St_Id


select St_Fname, Grade, crs_id,
x = lag(st_fname) over (partition by crs_id order by grade),
y = lead(st_fname) over (partition by crs_id  order by grade),
first = FIRST_VALUE(st_fname) over (partition by crs_id order by grade),
last = LAST_VALUE(st_fname) over (partition by crs_id order by grade)
from Stud_Course inner join Student on student.St_Id = Stud_Course.St_Id

