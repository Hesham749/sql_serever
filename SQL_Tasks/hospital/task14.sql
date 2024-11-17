select first_name
from patients
group by first_name
HAVING count(first_name) =1