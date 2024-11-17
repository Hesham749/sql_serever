use Company_SD
SELECT top 2
    (Salary)
FROM Employee
WHERE Salary = (select MAX(Salary)
FROM Employee)
