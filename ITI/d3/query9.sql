SELECT e.Fname , p.Pname
FROM Employee AS e , Works_for AS w , Project AS p
WHERE w.ESSn = e.SSN AND w.Pno = p.Pnumber
ORDER BY p.Pname