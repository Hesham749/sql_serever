select  first_name , last_name , province_name
from patients inner join province_names
on patients.province_id = province_names.province_id