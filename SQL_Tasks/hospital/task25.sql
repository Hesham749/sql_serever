SELECT CONCAT( UPPER(last_name), ',' , LOWER(first_name)) as full_name
FROM patients
ORDER by first_name DESC