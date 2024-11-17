SELECT d.*
FROM Departments AS d , Employee AS e
WHERE e.Dno =  d.Dnum AND e.SSN = (select MIN(SSN) FROM Employee )
