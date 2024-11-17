SELECT first_name , last_name , allergies
FROM patients
WHERE allergies in ('Penicillin' , 'Morphine')
ORDER BY allergies , first_name , last_name