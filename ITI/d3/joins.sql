SELECT st.St_Fname as student_name , super.St_Fname as super_name
FROM Student as st , Student as super
WHERE st.St_super = super.St_Id


SELECT Grade
FROM Stud_Course
WHERE Stud_Course.St_Id in (
    SELECT St_Id
FROM Student
WHERE 	St_Address = 'cairo'
)

update Stud_Course
set Grade -= 10
WHERE Stud_Course.St_Id in (
    SELECT St_Id
FROM Student
WHERE 	St_Address = 'cairo'
)

-- if the value is null it will replace it with the second parameter
SELECT ISNULL(St_Fname, 'not found')
FROM Student

-- concat will convert all argument to string and if there is a null value it will be empty string
SELECT CONCAT(St_Fname ,' ' , St_Lname)
FROM Student

--! any add equation with null the result is null
-- convert to the targeted data type
SELECT ISNULL( St_Fname,'') + ' ' + ISNULL( St_Lname , '') + CONVERT(varchar(2) , ISNULL(St_Age,0))
FROM Student


SELECT St_Fname
FROM Student
WHERE St_Fname LIKE 'ahmed'


/*

                --? wild card
--! 'a%h'  start with (a) and end with (h)
--! '%a_'  end with (a) and any character after that
--! 'ahm%'  start with (ahm)
--! '[ahm]%'  start with (a) or (h) or (m)
--! '[^ahm]%'  not start with (a) or (h) or (m)
--! '[a-h]%'   in the range range
--! '[^a-h]%'   not in the range

*/
