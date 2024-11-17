SELECT MAX(weight) - MIN(weight) as weight_data
FROM patients
WHERE last_name = 'Maroni'