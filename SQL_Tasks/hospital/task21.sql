SELECT city , COUNT(*) as total_patient
FROM patients
GROUP by city
ORDER by total_patient DESC , city