SELECT first_name , last_name , COUNT(*) as num_of_dublicated
FROM patients
GROUP BY first_name ,last_name
HAVING COUNT(*) > 1


