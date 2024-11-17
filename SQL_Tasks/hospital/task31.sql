SELECT doctor_id  , CONCAT(first_name,' ', last_name), MAX(admission_date) as first_addmission , MIN(admission_date) as last_addmission
From admissions CROSS  join doctors
GROUP by doctor_id , first_name ,last_name
