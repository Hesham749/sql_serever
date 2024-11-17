USE ITI

--! value window functions


-- ?    LAG()
-- takes 2 arguments first one is column and the second is the number of previous column and the the lag() gets the value of that pervious column
-- ?    lead()
-- like lag() but it gets the next columns

--! first and last value should use partion with it
-- ?  LAST_VALUE()
-- ?  FIRST_VALUE()


--! offSet fetch
SELECT *
FROM Instructor
ORDER BY Ins_Id
OFFSET 3 ROWS
FETCH NEXT 3 ROWS ONLY