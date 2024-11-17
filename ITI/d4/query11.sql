use Company_SD


SELECT e.SSN , e.Fname
FROM Employee AS e
WHERE exists (select * FROM Dependent WHERE Dependent.ESSN = e.SSN)


-- second method

SELECT e.SSN , e.Fname
FROM Employee AS e , Dependent
WHERE e.SSN = Dependent.ESSN
GROUP BY SSN , Fname