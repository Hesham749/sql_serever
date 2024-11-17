USE ITI


SELECT st.St_Fname , su.*
FROM Student AS st JOIN Student su
ON st.St_super = su.St_Id