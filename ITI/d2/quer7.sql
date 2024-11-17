SELECT Dnum as [Departments id] , Dname as name
FROM Departments
WHERE MGRSSN in (

SELECT SSN
FROM Employee
WHERE SSN = 968574)