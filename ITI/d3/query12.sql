SELECT *
FROM Employee as e LEFT OUTER JOIN Dependent AS dpn
ON dpn.ESSN = e.SSN
