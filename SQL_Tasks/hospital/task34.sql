SELECT CONCAT(p.first_name , ' ' , p.last_name) as PatientName , ad.diagnosis ,CONCAT(d.first_name , ' ' , d.last_name) as doctorName
FROM patients as p INNER JOIN admissions as ad
    ON p.patient_id = ad.patient_id INNER JOIN doctors as d
    ON d.doctor_id = ad.attending_doctor_id