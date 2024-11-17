SELECT
    patients.patient_id,
    patients.first_name
FROM
    patients
WHERE
    first_name LIKE 's%s'
    AND LEN(first_name) >= 6