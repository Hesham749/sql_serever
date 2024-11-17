USE ITI

SELECT DISTINCT  r.Dept_Id , ISNULL(Salary, 0) as salary , dr FROM
(
SELECT *  , DENSE_RANK()OVER(PARTITION BY Dept_Id   ORDER by i.salary desc) AS dr
FROM Instructor AS i ) as r
WHERE dr in(1,2)
ORDER by Dept_Id , salary DESC

