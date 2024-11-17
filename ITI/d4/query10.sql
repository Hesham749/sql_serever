use Company_SD


UPDATE e
SET Salary *=1.30
FROM Employee AS e , Works_for AS w , Project as p
WHERE w.ESSn = e.SSN AND   w.Pno = p.Pnumber  and  p.Pname = 'AL Rabwah'
