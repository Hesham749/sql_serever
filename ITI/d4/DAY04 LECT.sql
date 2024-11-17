--DAY 04 LEC 


SELECT SUM(Salary)
FROM Instructor

SELECT MIN(SALARY) AS [MIN VALUE],  MAX(Salary) AS [MAX SALARY]
FROM Instructor

SELECT COUNT(*), COUNT(St_Id), COUNT(St_Lname), COUNT(St_Age)
FROM Student

--LA7Z EL FAR2
SELECT AVG(St_Age), SUM(St_Age)/COUNT(*)
FROM Student
--MMKN ast5dm isnull(col, value) bt7wl ai kema null fel colun da lel value
SELECT AVG(isnull(St_Age,0)), SUM(St_Age)/COUNT(*)
FROM Student

--agg functions slowing down the software 
--once ene as5dmt agg function keda b2a aggg query 
--fel agg query lw 3ayz a select non agg col, lazm agroup by beh
-- w lw 3ayz agroup by any column lazm ykon mwgod fel select
--awl 7aga btsht3'l from w b3dha where yro7 ygeb el values mn el from w y3ml filtering ll rows bel where, w b3dha yd5ol 3la group by y2smha le groups , w b3dha y3ml filtering 3la l groups bel agg functions bel having, w b3dha y selct el results orderd lw fe order by clause.

--use join with agg functions 
--MMKN AGROUB BY KAZA COL
SELECT SUM(Salary),D.Dept_Id,D.Dept_Name
FROM Instructor I INNER JOIN Department D 
ON D.Dept_Id = I.Dept_Id

select avg(st_age), St_Address,Dept_Id
from Student
GROUP BY St_Address,Dept_Id

select sum( salary), Dept_Id
from Instructor
where Salary>2000
group by Dept_Id

select sum( salary), Dept_Id
from Instructor
group by Dept_Id
having sum(Salary)>20000

--msh lazm el having ykon m3aha nfs el agg fun elle fel select
select sum( salary), Dept_Id
from Instructor
group by Dept_Id
having count(Ins_Id)>5
-------------------------------------------------------------
--subquery

select * 
from Student
where St_Age< (select avg(St_Age) from Student)

select * , (select COUNT(St_Id) from Student)
from Student

--msh lazm 3lshan el agg w msh lazm ykono mn nfs el tabel 

select Dept_Name
from Department
where Dept_Id in (select distinct(Dept_Id) 
					from Student
					where Dept_Id is not null)
--da kan mmkn yt3ml join, w el join afdl fel performance mn el subquery 
--asln el engine 3ndo optimizer lma yshof el subquery yro7 yshof lw fe join wla la2, lw ynf3 b execute it as join, enma lw hya 3 4 join bn3mlha subquery a7sn
------------------
--subquery + dml (insert-delete-update) values (rows )

delete from Stud_Course
where St_Id = 1 

--tyb lw 3ayz a delete el nas elle 3aysha fe cairo
--mmkn b join w mmkn subquery 
delete from Stud_Course
where St_Id in (select st_id from Student where St_Address = 'cairo')

-----------------------------------------------------------
--union family
--union all by7ot kol el rows fo2 b3d mn 7agat mlhash 3laka bb2d asln w lkn lazm ykon data type w mmkn at7ayl 3la l mwdo3 b convert 3ady

select St_Fname
from Student
union all
select Ins_Name
from Instructor

--union bygm3 b distinct --> yshel el motshabeh w orderd
select St_Fname
from Student
union 
select Ins_Name
from Instructor

--except bygeb elle mwgod fel awlanya w sh mwgod fel tanya
select St_Fname
from Student
except
select Ins_Name
from Instructor

--intersect bygeb el moshtrk benhom 
select St_Fname
from Student
intersect
select Ins_Name
from Instructor
------------------------------
--top rows
select top 3 (st_fname)
from Student
--lw 3ayz mn t7t e3mlha top m3 3ks el trteb