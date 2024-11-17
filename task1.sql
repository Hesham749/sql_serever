
go
create table Department 
(
Dname varchar(5) not null ,
DNum tinyint primary key identity(10,10),
MGRSSN int not null ,
MGRStart_Date date not null,
)

create table Employee 
(
SSN int primary key,
Fname varchar(50) not null ,
Lname varchar(50) not null ,
BDate date not null,
Sex char(1) not null,
Salary smallmoney not null,
Dno tinyint foreign key references Department(DNum) on delete set null on update cascade,
Superssn int foreign key references Employee(SSN),
)

create table Project 
(
Pname varchar(50) not null,
Pnumber int primary key identity(100,100),
Plocation varchar(80) not null ,
City varchar(20) not null,
Dnum tinyint not null foreign key references Department(DNum) on delete no action on update cascade,
)

create table works_for
(
ESSN int ,
Pno int not null foreign key references Project(Pnumber) on update cascade ,
constraint works_for_pk primary key(ESSN, Pno),
)

create table [Dependent] 
(
ESSN int references works_for(ESSN),

)