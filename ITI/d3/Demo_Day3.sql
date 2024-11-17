--joins
--cross join
select st_fname,dept_name
from student s,department d

select st_fname,dept_name
from student s cross join department d

--inner join -equi join
--equi join
select st_fname,dept_name
from student s,department d
where d.dept_id=s.dept_id

--inner join
select st_fname,dept_name
from student s inner join department d
	on d.dept_id=s.dept_id

--outer join
--left outer join
select st_fname,dept_name
from student s left outer join department d
	on d.dept_id=s.dept_id

--right outer join
select st_fname,dept_name
from student s right outer join department d
	on d.dept_id=s.dept_id

--full outer join
select st_fname,dept_name
from student s full outer join department d
	on d.dept_id=s.dept_id

--self join
select s.st_fname,s1.*
from student s,student s1
where s1.st_id=s.st_super

select s.st_fname,s1.*
from student s inner join student s1
on s1.st_id=s.st_super

-------------------
--agg functions
--min,max,sum,avg,count
select *
from student

select count(*)
from student

select count(st_age)
from student


select sum(salary)
from instructor


select avg(salary)
from instructor


select dept_id,count(st_id)
from student
group by dept_id


select d.dept_id,dept_name,count(st_id)
from student s,department d
where d.dept_id=s.dept_id
group by d.dept_id,dept_name


select dept_id,count(st_id)
from student
group by dept_id
having count(st_id)>5


select dept_id,sum(salary)
from instructor
group by dept_id
having count(ins_id)=7


--sub query
select *
from student
where st_age>(select avg(st_age) from student)


select *,(select count(st_id) from student)
from student


--exists



--union [all]
select st_id,st_fname from student
union all
select ins_id,ins_name from instructor
