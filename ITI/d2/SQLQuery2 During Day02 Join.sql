--16/11/2021 
--Lec 3 DB 
---------------------------
--Join
---------------------
--1. Cross (cartesian) join
--bydrb el 2 fe b3d k2nhom matrices 
--rows = row of 1st table * rows of 2nd table
select St_Fname, Dept_Name
from Student , Department

--mmkn ytktb keda 

select St_Fname, Dept_Name
from Student cross join Department
-----------------------------
--2. Inner Join
--bygeb el common ben el 2 tables 

select St_Fname, Dept_Name
from Student , Department
where Department.Dept_Id = Student.Dept_Id

--mmkn ytktb keda 

select St_Fname, Dept_Name
from Student inner join Department
on Department.Dept_Id = Student.Dept_Id

--mmkn ast5dm alias 

select S.St_Fname, D.Dept_Name
from Student S inner join Department D
on D.Dept_Id = S.Dept_Id

--Lw 3ayz ageb esm el taleb  w kol tafasel el dep elle hwa feh 
--on badeel ll where fa at3aml m3aha k2nha where fel conditions
select S.St_Fname, D.*
from Student S inner join Department D
on D.Dept_Id = S.Dept_Id and d.Dept_Location='alex'
order by Dept_Name
--------------------------------------------
--Outer Join
--1. Left outer join
--hygeb kol el rows elle fel left sided tabel
select S.St_Fname, D.Dept_Name
from Student S left outer join Department D
on D.Dept_Id = S.Dept_Id

--2.Right outer join 
--hygeb kol el rows elle fel right sided tabel
select S.St_Fname, D.Dept_Name
from Student S right outer join Department D
on D.Dept_Id = S.Dept_Id

--3. Full outer join
--hygeb kol el rows fel gadwlen whatever what
select S.St_Fname, D.Dept_Name
from Student S full outer join Department D
on D.Dept_Id = S.Dept_Id
------------------------------------------------------------
--self join
--lma ykon fe self relation 
---fe gdwl student 3ayz esm el taleb w esm el supervisor 
--a3ml nos5a mn el gdwl fel memory runtime 
--asmy wa7da elle m3ya fel db x w tb2a hya el child elle feha el fk
--w elle fel memory hya y w hya el parent elle feha el pk 
--mfish no3 mo3yn lel self mmkn tb2a inner aw left aw ai 7aga 
select x.St_Fname as studentname , y.St_Fname as supervisorname
from Student x inner join Student y 
on y.St_Id = x.St_super
---------------------------------------------------------

--join multiple tables 
select St_Fname, Crs_Name, Grade
from Student S, Stud_Course SC, Course C
where s.St_Id = sc.St_Id and c.Crs_Id = sc.Crs_Id

--lw 7bet aktbo bel inner join
select St_Fname, Crs_Name, Grade, D.Dept_Name
from Student S inner join  Stud_Course SC 
on s.St_Id = sc.St_Id
inner join 
Course C
on c.Crs_Id = sc.Crs_Id
inner join Department D
on d.Dept_Id = s.Dept_Id
------------------------------------------------------------
--join with DML
--1. join update

--hna 36 row affected l2no 3'yr el gdwl da kolo 
update Stud_Course
set grade +=10
--tyb lw 3ayz update where condition mn gdwl tany 
--hna 18 rows affected bs 
--l2no 3ml update lel result bta3t el join bs 
update crs
set grade +=10
from Student S inner join Stud_Course crs
on s.St_Id = crs.St_Id and s.St_Address = 'cairo'

----search for join with delete 
--------------------------------------------------------------------
--isnull(column,'value')
--function lma tla2y null fel col da hatshelo w t7ot mkano el value di
select isnull(St_Fname,'maaaaashy') as [new name]
from Student
--mmkn a7ot mkano value mn col tany
--lw ml2ash first name y7ot mkan last name
select isnull(St_Fname,St_Lname) as [new name]
from Student

--lw ml2ash last name tyb w 3ay 22olo lw ml2tsh first 7ot last lw ml2tsh last 7ot addrss w hakaza 
--function coalesce (probable null, alternative1, alternative 2,....)
select coalesce(St_Fname, st_lname, st_address) as [new name]
from Student

--lw 3ayz a3ml casting ll data 
select 'student name= '+st_fname +'   &age= '+convert(varchar(2),st_age) 
from Student
--l moshkla lw fe null 
select isnull(st_fname,'')+'  '+ isnull(convert(varchar(2),St_Age),0 )
from Student

--best performance 
--conact function(many cols as arguments )
--1. btgm3 el values gnb b3d bdl ma a7ot + + +
--2. bt7wl kolo le string values bdl ma a3ml convert 
--3. btshel ai null value w t7ot ' ' space 
select concat (st_fname,' ',st_age)
from Student
--------------------------------------------------
--lw string condition 
--= vs like 
-- = lw 3arf el klma kolha w bdwr 3leha kolha 
select *
from Student 
where st_Fname = 'ahmed'

--like mmkn adwr 3la klma b goz2 mnha (contains)
-- _ means missing char here, % means zero or many chars missing here 
select *
from Student 
where st_Fname like '%a%'
--lma aktb keda 
--'[ahm]%' bybd2 bel a or h or m 
--'[^ahm]% msh btbd2 b a nor h nor m 
--'[a-h]%' btbd2 b ai 7rf fel range mn a le h 
--'[^a-h]%' msh btbd2 b ai 7rf fel range da  
--'[346]%' btbd2 b rkm 3 aw 4 aw 6 
--'%[%] btnthy b 7rf el percentage, el [%] lma a7oto fe bracket yb2a 2sdy hwa nfso ka char'
--%[_]% 7aga gwaha underscore  ahmed_ali
--[_]%[_] 7aga awlha w a5erha underscore   _ahmed_


select st_fname, Dept_Id,St_Age
from Student
order by St_Address


select st_fname, Dept_Id,St_Age
from Student
order by 1 --awl column y3ny el fname

select st_fname, Dept_Id,St_Age
from Student
order by 3 --talt column y3ny el age

select St_Fname, Dept_Id, St_Age
from Student
order by St_Id, St_Age --mlhash m3na l2n el id msh hytkrr


