SELECT d.Dname , MIN(e.Salary) AS minimum , MAX(e.Salary) AS maximum , AVG(e.Salary) AS average
FROM Departments AS d , Employee AS e
WHERE e.Dno =  d.Dnum
GROUP BY d.Dname
