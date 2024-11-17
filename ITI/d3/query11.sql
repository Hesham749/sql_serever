SELECT *
FROM Employee
WHERE Employee.SSN IN (select Departments.MGRSSN
FROM Departments)
