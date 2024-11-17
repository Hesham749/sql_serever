SELECT Employee.Fname , Dependent.*
FROM Dependent , Employee
WHERE Dependent.ESSN = Employee.SSN
