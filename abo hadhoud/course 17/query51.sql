USE EmployeesDB

SELECT emp.Name , emp.ManagerID , emp.Salary , mng.Name
FROM Employees AS emp JOIN Employees AS mng
    ON emp.ManagerID = mng.EmployeeID