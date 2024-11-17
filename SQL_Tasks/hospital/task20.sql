SELECT patient_id ,diagnosis
FROM admissions
GROUP by patient_id , diagnosis
HAVING COUNT(*) > 1
