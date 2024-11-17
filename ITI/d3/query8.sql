SELECT e.Fname
FROM Employee as e , Employee as s
WHERE e.Superssn = s.SSN AND s.Fname = 'Kamel' AND s.Lname = 'Mohamed'