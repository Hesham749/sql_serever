SELECT d.Dependent_name as name , d.Sex as gender
FROM Dependent as d , Employee AS e
WHERE d.Sex = 'F' and d.ESSN = e.SSN AND e.Sex = 'f'

UNION

SELECT d.Dependent_name as name , d.Sex as gender
FROM Dependent as d , Employee AS e
WHERE d.Sex = 'M' and d.ESSN = e.SSN AND e.Sex = 'M'

