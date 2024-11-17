select first_name , last_name , allergies
from patients
where allergies is not null and city = 'Hamilton'
