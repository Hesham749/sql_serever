SELECT province_name , COUNT(*) as patient_count
FROM province_names as pr INNER JOIN patients
    ON pr.province_id = patients.province_id
GROUP BY province_name
ORDER BY patient_count desc