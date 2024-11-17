use ITI


SELECT distinct * FROM
(
SELECT Salary , DENSE_RANK() OVER(ORDER BY Salary desc) dr
FROM Instructor) r1
WHERE dr IN (1,2)
ORDER BY Salary DESC
