SELECT patient_id, first_name , last_name
from patients
WHERE patient_id in (SELECT patient_id
FROM admissions
WHERE diagnosis = 'Dementia')
