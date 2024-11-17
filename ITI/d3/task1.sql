SELECT d.Dnum , Dname , d.MGRSSN as manager_id , m.Fname as manager_name
FROM Departments as d , Employee as m
WHERE d.MGRSSN = m.SSN