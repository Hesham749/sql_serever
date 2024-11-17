SELECT d.Dnum , d.Dname , COUNT(*) AS total_employee , AVG(Salary)
FROM Departments AS d , Employee as e
WHERE e.Dno = d.Dnum
GROUP BY d.Dnum , d.Dname
HAVING AVG(Salary) < (select AVG(Salary) FROM Employee)
