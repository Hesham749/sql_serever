SELECT p.Pnumber , p.Dnum ,d.Dname , m.Lname ,m.Address , m.Bdate
FROM Project AS p , Departments AS d , Employee AS m
WHERE p.Dnum = d.Dnum AND d.MGRSSN = m.SSN AND p.City = 'Cairo'
ORDER BY p.Pname