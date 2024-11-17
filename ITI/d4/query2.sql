SELECT p.Pname , SUM([Hours])  AS total_hours
FROM Project AS p , Works_for AS w
WHERE w.Pno = p.Pnumber
GROUP BY p.Pname
