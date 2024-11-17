insert into makes
select distinct carDetails.Make 
from  carDetails
order by Make 

select * from carDetails

update carDetails
set carDetails.MakeID = (select makeID from makes where carDetails.Make = makes.makeName)
