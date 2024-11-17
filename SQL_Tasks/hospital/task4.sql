select patients.first_name as [first name] , patients.last_name as [last name] 
from patients
where patients.weight >= 100 and patients.weight <= 120
