SELECT 
FROM patients
GROUP by allergies
HAVING allergies IS NOT NULL
ORDER BY COUNT(*) DESC
