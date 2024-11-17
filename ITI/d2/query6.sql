SELECT SSN as [Employee id] , CONCAT(Fname , ' ' , Lname) as name
FROM Employee
WHERE (Salary*12) > 10000