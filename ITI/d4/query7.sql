use Company_SD
SELECT e.* , p.*
FROM Employee AS e , Project AS p , Works_for AS w
WHERE w.ESSn = e.SSN AND w.Pno = p.Pnumber
ORDER BY e.Dno , e.Lname , e.Fname