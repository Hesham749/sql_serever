SELECT d.Dnum , d.Dname , p.Pname
FROM Departments as d , Project as p
WHERE p.Dnum = d.Dnum