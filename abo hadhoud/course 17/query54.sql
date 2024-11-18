USE EmployeesDB

SELECT emp.Name , emp.ManagerID , emp.Salary , isnull(mng.Name,emp.name)
FROM Employees AS emp JOIN Employees AS mng
    ON emp.ManagerID = mng.EmployeeID
WHERE mng.Name = 'Mohammed'