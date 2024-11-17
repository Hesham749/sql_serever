--3 types of SP
--1) built in SP
	sp_bindrule
	sp_unbindrule
	sp_helpconstraint
	sp_rename
	sp_addtype
--2) User Defined SP
	Select * 
	from student

create proc Getst 
as
	select *
	from Student

Getst
execute Getst

create proc GetStbyAddress @add varchar(20)
as
	select st_id,st_fname,st_address
	from Student
	where st_address=@add

GetStbyAddress 'alex'

delete from Student where st_id=1

insert into Student(st_id,st_fname)
values(663,'ali')

alter proc InstSt @id int,@name varchar(20)
as
	begin try
		insert into Student(st_id,st_fname)
		values(@id,@name)
	end try
	begin catch
		Select 'Error'
	end catch


InstSt 44,'ali'
	
alter proc Sumdata @x int=100,@y int=100
as
	Select @x+@y
		
Sumdata 3,9   ---calling parameter by position   
Sumdata @y=9,@x=4   -- calling parameter by Name
Sumdata 3
Sumdata

create proc GetStbyAge @age1 int,@age2 int
AS
	select st_id,st_fname
	from Student
	where st_age between @age1 and @age2


insert into tab4(st_id,st_fname)
execute GetstbyAge  23,28

declare @t table(x int,y varchar(20))
insert into @t
execute GetstbyAge  23,28
select count(*) from @t

Create Proc Getdata @id int
as
	declare @age int
		Select @age=st_age
		from Student
		where st_id=@id
	return @age


declare @x int
Set @x=execute Getdata 3
select @x


alter Proc Getdata @id int,@age int output
as
	Select @age=st_age
	from Student
	where st_id=@id
	
declare @x int
execute Getdata 3,@x output
select @x
alter Proc Getdata @id int,@age int output,@name varchar(20) output
as
	Select @age=st_age,@name=st_fname
	from Student
	where st_id=@id
		
declare @x int,@y varchar(20)
execute Getdata 6,@x output,@y output
select @x,@y
-----------------------------------------------------------------------------
alter Proc Getmydata @age int output,@name varchar(20) output
with encryption
as
	Select @age=st_age,@name=st_fname
	from Student
	where st_id=@age

sp_helptext 'getmydata'
		
declare @x int=6,@y varchar(20)
execute Getmydata @x output,@y output
select @x,@y


create proc getalldata @col varchar(20),@tab varchar(20)
as
	execute('Select '+@col+' from '+@tab)

getalldata 'ins_name','instructor'
-------------------------------------------------------------------
--3)Trigger
-------------
--Can't call
--can't Send parameter
--triggers  on Table
--insert update delete

insert into Student(st_id,st_fname)
values(779,'ali')


create trigger t1
on student
after insert
as
	select 'welcome to ITI'


create trigger t2
on student
for update
as
	select getdate()


update Student
	set st_age+=1


create trigger t3
on student
instead of delete
as
	select 'Not allowed for user= '+suser_name()

delete from Student where st_id=779


create trigger t4
on department
instead of insert,update,delete
as
	select 'not allowed'

update Department
	Set dept_name='Cloud'
where Dept_Id=5000

drop trigger t4

alter table department disable trigger t4
alter table department enable trigger t4


alter trigger sales.t7
on sales.student
after update
as
	if update(name)
		select 'hi'


update sales.student
	set name='ahmed'
where id=7


create trigger t5
on course
after update
as
	select * from inserted
	select * from deleted


update course
	set crs_name='html5',crs_duration=40,top_id=1
where crs_id=900


update course
	set crs_name='oop',@x=crs_name
where crs_id=100

create trigger t7
on student
instead of delete 
as
	select st_fname from deleted

delete from Student
where st_id=779


create trigger t8
on course
after update
as
	select crs_name from deleted


update course
	set crs_name='Cloud',crs_duration=45
where crs_id=300


create trigger t9
on course
after delete
as
	if format(getdate(),'dddd')='friday'	
		begin
			select 'not delete'
			--rollback
			insert into course
			select * from deleted
		end

create trigger t9
on course
instead of delete
as
	if format(getdate(),'dddd')!='friday'	
		begin
			delete from course where crs_id =(select crs_id from deleted)
		end

create table history
(
 _User varchar(20),
 _date date,
 _oldid int,
 _Newid int
)

create trigger t10
on topic
instead of update
as
	if update(top_id)
		begin
		declare @new int,@old int
		select @old=top_id from deleted
		select @new=top_id from inserted
		insert into history
		values(suser_name(),getdate(),@old,@new)
		end
----------------------------------------------
--output
delete from student
output getdate(),deleted.st_fname
where st_id=44

delete from student
output getdate(),deleted.st_fname
where st_id=21


update Student
	set st_fname='ali'
output suser_name(),inserted.st_age
where st_id=1


update Student
	set st_fname='ali'
output suser_name(),inserted.st_age  into history
where st_id=1

insert into student(st_id,st_fname)
output 'welcome to iti'
values(444,'ali')

---------------------------------------------------
select *
from Student
for XML raw

select *
from Student
for XML raw('student')

select *
from Student
for XML raw('student'),elements


select *
from Student
for XML raw('student'),elements,Root('ITI_Studs')








