select * into hr.student from dbo.Student

select * from hr.student

create synonym hs for hr.student

select * from hs

alter schema dbo transfer hr.topic