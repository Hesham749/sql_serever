use master
go

------------------------ 1-database ---------------------------------------------

--------------------create database ---------------------------------

create database test1 
on (
name = test2024,
filename = 'D:\Courses\sql serever\test2024.mdf',
size = 25,
maxsize = unlimited ,
filegrowth = 15
)
log on (
name = test2024_log,
filename = 'D:\Courses\sql serever\test2024_log.ldf',
size = 8mb,
maxsize = 200mb,
filegrowth = 8mb
)

-------------------------------alter---------------------------------------

alter database test1
modify name = test_1

alter database test_1
modify file (
name = test2024 ,
size = 50
)
----------------------------drop database----------------------------------
drop database test_1

--------------------------------- 2-schema ----------------------------------

use test_1
go
------------------------------------create schema---------------------------

create schema HR 
authorization dbo

create schema Warehouse 

------------------------------------ ALTER SCHEMA ----------------------------

ALTER SCHEMA warehouse TRANSFER HR.student_course
ALTER SCHEMA HR TRANSFER warehouse.student_course
------------------------------------drop schema ------------------------------

drop schema Warehouse  -----------schema must be empty

------------------------------------- 3-tables --------------------------------

-----------------------------------create table-------------------------

--create table in default schema
CREATE TABLE employee
(
id INT , --user assign  -- ( CONSTRAINT employee_pk PRIMARY KEY  --second method )
[name] nvarchar(50) not null,
age tinyint not null,
salary dec(7,2) not null DEFAULT 3000,
email varchar(50),
-- PRIMARY KEY (id) -- create the primary key without assign a name for it, it will be assigned by the system
 CONSTRAINT employee_pk PRIMARY KEY (id), --best practice to make composite primary key
 CONSTRAINT employee_email_un UNIQUE (email),     

)


--create table in HR schema
CREATE TABLE HR.employee(
id int primary key IDENTITY(10,1), -- if you write the IDENTITY  only it will start with 1 and increase by 1
[name] nvarchar(50) not null,
age tinyint not null CHECK (age >= 20 ),
salary dec(7,2) not null DEFAULT 3000,   -- 5 digit and 2 after the point  
email varchar(50) UNIQUE,


)

CREATE TABLE HR.course (
id int IDENTITY ,
course_code varchar(5) NOT NULL ,
PRIMARY KEY (id)

)

CREATE TABLE HR.student (
id int ,
[name] varchar(50) NOT NULL ,
CONSTRAINT course_pk PRIMARY KEY (id)
)

CREATE TABLE HR.student_course 
(
	student_id int ,
	course_id int,
	PRIMARY KEY (student_id , course_id),
	FOREIGN KEY (student_id) REFERENCES HR.student(id) ON DELETE CASCADE ON UPDATE CASCADE ,
	FOREIGN KEY (course_id) REFERENCES HR.course(id) ON DELETE NO ACTION ON UPDATE CASCADE,
)  

------------------------------------- alter table -----------------------------
ALTER TABLE course 
ADD course_hours smallmoney

ALTER TABLE course
ALTER COLUMN course_name varchar(50) not null

ALTER TABLE course 
ADD DEFAULT 'HHHH' FOR course_name

ALTER TABLE course 
DROP COLUMN course_hours

ALTER TABLE course 
ADD CONSTRAINT course_pk PRIMARY KEY(id)

ALTER TABLE course 
DROP CONSTRAINT course_pk

------------------------------ drop table -------------------------

DROP TABLE HR.student
DROP TABLE HR.student_course

