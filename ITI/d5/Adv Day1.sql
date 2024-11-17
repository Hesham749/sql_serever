use iti

select top(5)  st_fname 
from student

select max(st_age)
from Student

select top(2)st_age
from Student
order by st_age desc


select st_fname+' '+st_lname as fullname
from Student
order by fullname

select st_fname+' '+st_lname as fullname
from Student
where fullname='ahmed ali'


--from
--join
--on
--where
--group by
--having
--select
--order by
--top
--distinct


select dept_name
from Department
where dept_id in (select distinct dept_id
                  from Student
				  where dept_id is not null)

select *
from student


--ServerName.DBname.SchmeaName.ObjectName

select *
from [DESKTOP-VF50P25].iti.dbo.course


select DepartmentID
from AdventureWorks2012..HumanResources.Department
union all
select dept_id
from Department


select st_fname
from Student
union all
select ins_name
from Instructor


select st_fname
from Student
union 
select ins_name
from Instructor

select st_fname
from Student
intersect 
select ins_name
from Instructor

select st_fname
from Student
except 
select ins_name
from Instructor

select st_fname
from Student
where st_fname is not null


select isnull(st_fname,'')
from Student

select isnull(st_fname,st_lname)
from Student

select coalesce(st_fname,st_lname,st_address,'No Data')
from Student


select sum(isnull(salary,bonus))
from Instructor
-----------------------------



select isnull(st_fname,'')+' '+isnull(convert(varchar(20),st_age),'')
from Student

select concat(st_fname,' ',st_age)
from Student

select convert(varchar(20),getdate(),101)
select convert(varchar(20),getdate(),102)
select convert(varchar(20),getdate(),103)
select convert(varchar(20),getdate(),104)


select cast(getdate() as varchar(20))


select format(getdate(),'dd MM yyyy')
select format(getdate(),'dddd MMMM yyyy')
select format(getdate(),'ddd MMM yy')
select format(getdate(),'dddd')
select format(getdate(),'MMMM')
select format(getdate(),'hh:mm:ss')
select format(getdate(),'dd MM yyyy hh:mm:ss')
select format(getdate(),'dd MM yyyy hh:mm:ss tt')

select format(getdate(),'MM')
select month(getdate())
-------------------------
insert into cairo.dbo.student
select * from alex.dbo.student


select * into Tab2
from Student


select * into Tab3
from Student


select * into DB1.dbo.instructor
from instructor

select st_id,st_fname into tab6
from student
where st_age<=22

select * into tab7
from Student
where 1=2



if exists(select st_fname from student where st_age=20)
	select 'ok'
else
	select 'No Data'
------------------
select st_fname,dept_name
from Student ,Department 

select st_fname,dept_name
from Student s ,Department d
where d.Dept_Id=s.Dept_Id

select st_fname,dept_name
from Student s  inner join Department d
on d.Dept_Id=s.Dept_Id

select st_fname,dept_name
from Student s left outer join Department d
on d.Dept_Id=s.Dept_Id

select st_fname,dept_name
from Student s right outer join Department d
on d.Dept_Id=s.Dept_Id

select st_fname,dept_name
from Student s full outer join Department d
on d.Dept_Id=s.Dept_Id


select x.st_fname,y.*
from Student x,Student y
where y.St_Id=x.St_super
----------------------------

