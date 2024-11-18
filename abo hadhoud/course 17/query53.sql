USE EmployeesDB

SELECT emp.Name , emp.ManagerID , emp.Salary , isnull(mng.Name,emp.name)
FROM Employees AS emp LEFT JOIN Employees AS mng
    ON emp.ManagerID = mng.EmployeeID