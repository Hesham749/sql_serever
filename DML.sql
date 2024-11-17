--------------------------data manipulation-----------------------------
--------------------------DML SQL---------------------------------------
------------------------------ 1- insertion opertaion---------------------

-- should send all the values with the same order
insert into department 
values
(2,'math'),
(3,'arabic'),
(4,'science')

-- should send all data except identity column 
-- if there is an identity column and we had a faild isertion the identity will count 
-- the faild insertion
insert into employee
values ('Hesham',1)


-- you can add more than one row at the same time
insert into instructor
values ('karim',null),
('sayed',1)


insert into student 
values
('hesham'),
('asmaa'),
('sasa'),
('ali')

-- second method insert in selected column with the selected order

insert into instructor(full_name)
values('smai'),
('zaoba')



----------------------------------- 2- update --------------------------


-- update without filtration
update instructor
set
department_id =3,full_name='sayed'

-- update with filteration

update instructor 
set 
full_name = 'Hesham' ,
department_id =1
where id =2 


------------------------------------ 3- Delete ---------------------------------------------

-- delete all rows without filteration

delete employee

-- deleate with filteration

delete employee 
where employee.id = 1
