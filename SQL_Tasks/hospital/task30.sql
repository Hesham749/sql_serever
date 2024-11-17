SELECT patient_id , attending_doctor_id , diagnosis
FROM admissions
WHERE (patient_id %2 != 0 and attending_doctor_id in (1, 5,19) ) OR (STR(attending_doctor_id) like '%2%' and LEN(STR(patient_id))=3)