declare c1 cursor
for select st_id,st_fname
	from student
	where st_address='cairo'
for read only     --update

declare @id int,@name varchar(20)
open c1
fetch c1 into @id,@name   -------->counter=0  -->first row
while @@FETCH_STATUS=0	
	begin
		select @id,@name
		fetch c1 into @id,@name  -------> counter++     move pointer
	end
close c1
deallocate c1

--one cell [ahmed,ali,amr,fady....]

declare c1 cursor
for select distinct(st_fname)
	from Student
	where st_fname is not null
for read only
declare @name varchar(20),@all_names varchar(300)=''
open c1
fetch c1 into @name
while @@FETCH_STATUS=0
	begin
		set @all_names=concat(@all_names,',',@name)
		fetch c1 into @name
	end
select @all_names
close c1
deallocate c1

declare c1 cursor
for select salary from Instructor	
for update
declare @sal int
open c1
fetch c1 into @sal
while @@FETCH_STATUS=0
	begin
		if @sal>=3000	
			update Instructor	
				set salary=@sal*1.20
			where current of c1
		else if @sal<3000
			update Instructor	
				set salary=@sal*1.30
			where current of c1
		else
			delete from Instructor
			where current of c1
		fetch c1 into @sal
	end
close c1
deallocate c1

/*
declare c1 cursor
for select st_fname from Student 
for read only
declare @name varchar(20),@counter int=0
open c1
fetch c1 into @name
while @@FETCH_STATUS=0
	begin 
		if @name='ahmed'
			begin
				fetch c1 into @name
				if @name='amr' and @@FETCH_STATUS=0
					set @counter+=1
			end
		fetch c1 into @name
	end
select @counter
close c1
deallocate c1
*/
-------------------------------------------------------------------

backup database iti
to disk='d:\myITIDB.bak'



create database ITISnap
on
(
 name='iti',   --mdf
 filename='d:\snap1.ss'
),
(
 name='file2',
 filename='d:\snap2.ss'
),
(
 name='file3',
 filename='d:\snap3.ss'
)
as snapshot of ITI



sp_configure 'enable_clr',1
go
reconfigure


select dbo.sum2integers(3,9)


select dbo.sum2integers(st_id,dept_id)
from Student


create table shapes
(
 sid int,
 sdesc varchar(20),
 coords Circle            --10,20,5   point(x,y)+raduis
)


select sdesc,coords.ToString()
from shapes
where coords.rad>10







select * from student



















