--Day 05
--lecture queries
------------------------------------
--top in t-sql

use ITI
select top 3*
from Student
where St_Address like 'alex'

select top 2 (salary) 
from Instructor
order by salary desc

--with ties 
--htgeb el tails m3aha, fe 2 student 3ndhom 21 sana
select top (3) with ties *
from Student
order by St_Age

--built in function for global universal id
select newid() 
--usually each table pk is uniqe on the table level, lkn mmkn ykon mwgod fe kol el tables, lkn el new id is unique on server level w random 
select *, newid()
from Student

--keda random order kol runtime 
--btst5dmha lw 3ayz a get random data from a table 
select *
from Student
order by NEWID()

----------------
--from 
--join 
--on 
--where 
--grouping
--having 
--select 
--order by 
------------
--servername.dbname.schemaname.objectname
--mmkn acall table from another database 
select*
from Company_SD.dbo.project

select dname
from Company_SD.dbo.Departments
union all
select Dept_Name
from Department
----------------------------
--ddl
--copy the table as a new table 
--w mmkn a3ml keda w a3mlo copy fe db tanya 3ady
select * into table2
from Student
--w mmkn a3ml keda w a3mlo copy fe db tanya 3ady
select *into company_sd.dbo.table2
from Student
where St_Address = 'alex'
--w mmkn a7ot condition always false w keda hya5od el metadata bta3t el table without data 
--k2ny get 3la l table right click (script)
--w a5od el code w a7oto fel mkan elle 3ayzo
---------------
--mmkn a7ot data from table into already exists 
--insert data based on select
insert into table2
select st_id,St_Fname from Student
-------------------------
--mmkn ast5dm having without group by lw el select feha agg bs
select sum(salary)
from Instructor
having count(ins_id) <100
----------------------------------- \
--ranking functions 
select *
from(
select*, ROW_NUMBER() over (order by st_age desc ) as RN
from student) as newtable
where rn= 3

select *
from(
select *, DENSE_RANK() over(order by st_age desc) as DR
from Student) as newtable
where dr =3

--partition by
select*
from(select *, ROW_NUMBER() over (partition by Dept_Id order by st_age desc) as Rn from student) as newtable
where rn =1

--partition by
select*
from(select *, ROW_NUMBER() over (partition by Dept_Id order by st_age desc) as dn from student) as newtable
where dn =1

--tnile
select*
from(
select *, NTILE(4) over(order by st_age desc ) as g 
from Student)  as newtable
where g=1
-----------------------
--datatypes
--numeric
--bit   bool  0:1   true:false 
--tinyint		 1byte       -128:+127  unsigned 0:255
--smallint		 2b			  -32768:+32767 unsigned 0:65555 
--int		   	8b
--big int	   	2g
---------------------------
--decimale
--smallmoney 4b  .0000
--money      8b   .0000
--real			0.0000000
--float				0.0000000000000......
--dec dec(digits,floats) dec(5,2) 122.12    12.898 xx
------------------------------
--char  char(max number 10msln)  ficxed length chars reserved
--varchar(max number 10msln) variable length charachter by7gz 3la 2d ma tktb
--nchar()
--nvarchar() n for scability lw 3ayz aktb ai lo3'a 3'er el english
---------------------------------
--datetime
-- Date mm/dd/yyyy
--time hh:mm
--time(7) hh:mm 12.7875464
--smalldatetime modern dates mm/dd/yyy hh:mm
--datetime   more dates range
--datetime(7)
--datetimeoffset 24/11/2021 10:30 +2:00 time zone
--------------------------------
--binary 01110101
--image bttsave as binaries 

