SELECT e.Fname
FROM Employee AS e , Works_for AS w , Project as p
WHERE Dno = 10 AND w.ESSn = e.SSN AND w.[Hours] >= 10 AND w.Pno = p.Pnumber AND p.Pname = 'AL Rabwah'