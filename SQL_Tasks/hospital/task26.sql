SELECT MAX()
FROM patients
GROUP BY province_id
HAVING sum(height) >= 7000