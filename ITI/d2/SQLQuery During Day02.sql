--DDL
--to create table
--default  values and not null values 
--getdate function as default value
Create table Employees
(
Eid int primary key,
Ename varchar(20) not null,
Eage tinyint,
Eadd varchar(50) default 'cairo',
HireDate date default getdate(),
DepNum int
)

--update table:
--add column
alter table Employees add Salary int

--edit column data type
--lw b7wl mn data type as3'r le akbr 3ady 
--lw mn akbr le as3'r (missing data) fa mynf3sh
alter table Employees 
alter column Salary bigint

--delete column
alter table Employees
drop column salary

--delete table itself 
drop table Employees 


-------------------------------------------------------------

--DMl
--hna bklm el data msh el entity
--insert update delete
--insert 
--bktb el values bnfs el tarteb elle 3mlt beh creation ll table 
insert into Employees 
values (1,'ali',null,'alex','1/1/2021',null)
--lw 3ayz ad5l btre2a tanya b tarteb mo5tff 
--aktb esm el cols ka argument lel Table fe el insert statmeny
-- w lazm en ba2y el columns elle msh katbha tkon does allow null
insert into Employees (Ename, Eid)
values ('Eman',2)
-- w mmkn bl tare2a di a3ml insert l kza row mara wa7da 
--insert constructor
insert into Employees (Ename,Eid)
values ('sayed',3),('fathi',4),('tarek',5)

--lw 3ayz a3ml update ll gdwl 
--set Ename = 'Omar' da hy5li kol el names omar
--set with where
update Employees
set Ename = 'Omar'
where Eid = 1

update Employees
set Eage+=1

--delete 
--delet row 
--da 3lshan fe el dml da byms7 values 
--delete row keda ana b delete values 
--delete structure ----> drop table (DDL)
--delete column------> alter table drop column (DDL)

delete from Employees 
where Eid = 1

----------------------------------------------------

--DQL

select * from Employees 

select Eid, Eage, Ename
from Employees
where Eid >2
order by Ename

--null is not a value so, lw 3ayz azhr el 7agat elle feha values bs w ashel el null 
--m2drsh 22ol el value != Null 
--22ol value is null or value is not null
use ITI
select *
from Student

select St_Fname+' '+St_Lname [Full name]
from Student
where St_Lname is not null

--distincit 
--btshel el mtkrr w bt3ml order by 
select distinct St_Fname
from Student

select *
from Student
where St_Address = 'masnoura' or St_Address = 'alex'
--di mmkn ttktb by in 
select *
from Student
where St_Address in ('mansoura', 'alex')

--select by range ( where property between value and value)
select  *
from Student
where St_Age >= 23 and St_Age <= 25
--mmkn ttktb keda 
select  *
from Student
where St_Age between 23 and 25

--mapping 
--create db by wizard 
--ddl 
--dml
--dql