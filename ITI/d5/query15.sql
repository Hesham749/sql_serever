USE ITI




SELECT  *
FROM (
    SELECT  *, ROW_NUMBER()OVER(PARTITION by s.Dept_Id order by NEWID() DESC) AS rn
    FROM Student s )r
    WHERE r.rn = 1