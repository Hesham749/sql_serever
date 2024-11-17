SELECT e.Lname , e.SSN
FROM Employee AS e , Departments AS d
WHERE d.MGRSSN = e.SSN AND d.MGRSSN NOT IN (select Dependent.ESSN
    FROM Dependent)
