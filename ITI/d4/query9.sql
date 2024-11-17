use Company_SD
SELECT CONCAT(Fname , ' ' , Lname) as FULL_name
FROM Employee
INTERSECT
SELECT Dependent.Dependent_name
from Dependent