declare c1 Cursor
for Select st_id,st_fname
	from Student
	where st_address='cairo'
for read only    --update

declare @id int,@name varchar(20)
open c1
fetch c1 into @id,@name
while @@FETCH_STATUS=0
	begin
		Select @id,@name
		fetch c1 into @id,@name			
	end
close c1
deallocate c1


select st_fname
from student
where st_fname is not NULL

--One Cell [ahmed,Amr,Mona..........]

declare c1 Cursor
for select st_fname
    from student
    where st_fname is not NULL and st_address='cairo'
for read only
declare @name varchar(20),@allnames varchar(300)=''
open c1
fetch c1 into @name
while @@FETCH_STATUS=0
	begin
		Set  @allnames=Concat(@allnames,',',@name)
		fetch c1 into @name
	end
Select @allnames
close c1
deallocate c1




declare c1 cursor
for Select salary
	from Instructor
for update    --DML
declare @sal int
open c1
fetch c1 into @sal
while @@FETCH_STATUS=0
	begin
		if @sal>=3000
			update Instructor	
				set salary=@sal*1.20
			where current of c1
		else
			update Instructor
				set salary=@sal*1.10
			where current of c1
		fetch c1 into @sal
	end
close c1
deallocate c1
-------------------------------------

declare c1 Cursor
for select st_fname
    from student
for read only

declare @name varchar(20),@counter int=0,@flag int=0
open c1
fetch c1 into @name
while @@FETCH_STATUS=0
	begin
		if @name='ahmed'
			begin
				set @flag=1 
				select  @name
			end
	
		if @name='amr'
			begin
				if @flag=1
					begin
						set @counter+=1
						set @flag=0
					end 
			end
		fetch c1 into @name
	end
select @counter
close c1
deallocate c1
-------------------------------------------------------------

backup database ITI
to disk='d:\iti_db.bak'

-------------------------------------------------------------
CREATE TABLE dbo.T1 ( column_1 int, column_2 VARCHAR(30),
					column_3 int IDENTITY primary key);
GO

SELECT * FROM T1

delete from T1  where Column_3 between 2 and 20



INSERT T1 VALUES (100,'ahmed');

INSERT T1 (column_2) VALUES ('Row #2');
GO
SET IDENTITY_INSERT T1 ON;
SET IDENTITY_Insert T1 off;
GO


INSERT INTO T1 (column_3,column_1,column_2)  VALUES 
(7,777, 'eman');

truncate table t1

GO
SELECT column_1, column_2,column_3
FROM T1;

drop table T1

dbcc checkident(T1,RESEED,3)

select @@identity

SELECT IDENT_CURRENT('t1')
------------------------------------------------------
--types of insert statement
-------------------------
--simple insert
--insert constructor
--insert based on select
--insert based on execute
--bulk insert
bulk insert emp
from 'd:\mydata.txt'
with (fieldterminator=',')
------------------------------------------------------
--Snapshot (read only DB)
---------------
create Database itisnap
on
(
name='ITI',
filename='d:\itisnap.ss'
)
as snapshot of iti


select * from student


restore database iti
from database_snapshot='itisnap'	--snapshot name in object explorer

--Cursor
--backup
--snapshot

--SQLCLR
-----------Function
-----------New data type    [class struct]

sp_configure 'clr_enable',1
go
reconfigure


select dbo.sum2Int(3,5)

select dbo.sum2Int(st_id,st_age)
from student

create table shapes
(
_id int,
_desc varchar(20),
_coords Circle
)

--10,20,30
select _desc
from shapes
where _Coords.x>=10

select _desc
from shapes




