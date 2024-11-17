SELECT doctor_id  , CONCAT(first_name,' ', last_name), MAX(admission_date) as first_addmission , MIN(admission_date) as last_addmission
From admissions INNER join doctors
    ON doctor_id =attending_doctor_id
GROUP by doctor_id , first_name ,last_name
