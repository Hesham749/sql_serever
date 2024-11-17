--lec 10
--Cursor 
--cursor is not a database object, it just refers to something in memory
--so Declare cursor not create cursor

--1 declare cursor 3lshan a7dd w a7ot feh el select statment elle hsht3'l 3la el data elle rag3a mnha
declare c1 cursor 
for
	select St_Id, St_Fname 
	from Student
	where St_Address ='cairo'
for read only ---or for update 
/*lw for read only yb2a ana h3rd bs el rows msh h3ml feha 7aga 
lw for update yb2a h3ml feha 7aga, y3ny h3dl 7aga fel data elle fel rows 
el default for update */

--2 declare variables 3lshan a-assign feha el values w 3'albn btb2y 2d el cols elle fel data elle rag3a ela lw e7tagt variable tany h3ml beh 7aga 
declare @id int, @name varchar(20)

--allocate pointer c1 3lshan ytntt 3la el rows wa7d wa7d w a7oto fel awl 3la awl row 
open c1

--3ayz a fetch awl row, fetch el cursor in el variables row by row  
/*k2ny blzbt b2olo eno ya5od el values elle fel rows elle rag3a mn el select w ebd2
7otaha row by row, kol row emsk el value elle fel column el folany 7otaha fel variable el folany 
w ybd2 ymsh satr satr m3 kol laffa fel loop tol manta btrg3 mn el fetch status 0*/
fetch c1 into @id,@name

--3ayz at2kd ana lesa fel loop w lesa 3ndy rows arg3ha sa7 wla la2 
/*el fetch status is a global variable has a value that indicates lw ana 3mlt fetch s7 wla la2
lw rg3 0 ----> tmam 3ml fetch s7, msk row w rg3o tmam
lw rg3 1 ----> kan fe row geh yrg3o l2a feh moshkla, 7d 3amlo lock msln aw ai 7aga 
lw rg3 2 ----> msh la2y rows yrg3ha, kan fe rows w 5lst */

while @@FETCH_STATUS = 0
--ana dlw2ty 3ayz a3rd bs el values di 
	begin
	--w ha simulate el counter ++ b ene a3ml fetch mara tanya gwa el loop b2a kol ma a5ls el process bta3ty elle h3mlha a3ml fetch mara tany 3lshan el pointer ynot 3la el row elle b3do w tol mana tmam lesa fe available rows el fetch status hyb2a b zero fana gwa el loop, awl ma y7sl moshkla 1 or 2 ha5rog bara el loop 
	select @id,@name
	fetch c1 into @id, @name
	end
close c1 --b3ml save ll pointer fel current place 3lshan lw 7bet aw2f looping fe mkan mo3yn w aro7 a3ml 7aga tanya fe el db w arg3 ab2a 3arfv ana w2ft fen w a3ml open c1 tany w akml
deallocate c1 --byms7 el memory elle kan wa5dha el cursor w lw 3ayz a3ml wa7d tany lazm abd2 mn el awl 5als 
--w lazm arun kol elstpes di sawa l2nha zy ma 2olna variable not db object 

--el result set bta3to btb2a scattered data kol row lw7do w hya di mohmt el cursor 
----------------------------------------------------------------------------------------

select St_Fname
from Student
where St_Fname is not null
--3ayz a3rd elresult set di as one cell kol el asamy wara b3d fe cell wa7da separated by comma 
--ha loop 3la el asamy w abd2 a concate fe variable mo3yn w a3rd el variable da 

declare c1 cursor
for 
	select St_Fname
	from Student
	where St_Fname is not null
for read only 

declare @name varchar(20), @allnames varchar (300) = ''
open c1 
fetch c1 into @name
while @@FETCH_STATUS = 0
	begin 
	set @allnames =CONCAT(@allnames,',',@name)
	fetch c1 into @name
	end
	select @allnames
close c1
deallocate c1
---------------------------------------
--cursor for update
declare c1 cursor 
for
	select Salary
	from Instructor
for update 
declare @sal int 
open c1 
fetch c1 into @sal
while @@FETCH_STATUS = 0
begin
	if @sal >= 3000
		update Instructor
			set salary = @sal *1.2
		where current of c1
	else 
		update Instructor
			set Salary = @sal *1.1
		where current of c1

	fetch c1 into @sal
end 
close c1
deallocate c1
------------------------------------------------
declare c1 cursor
for 
	select St_Fname
	from Student
for read only 

declare @name varchar(20), @counter int=0, @flag int = 0
open c1 
fetch c1 into @name
while @@FETCH_STATUS = 0
	begin 
		if @name = 'ahmed' 
			set @flag = 1
		if @name = 'amr'
			set @counter +=1
	fetch c1 into @name
	end
	select @counter
close c1
deallocate c1
---------------------------------------------------
--backup, store
backup database SD
to disk = 'F:\ITI\database iti\Day10\SD.bak'
------------------------------------------
--reset identity
CREATE TABLE dbo.T1 ( column_1 int, column_2 VARCHAR(30),
					column_3 int IDENTITY primary key);
GO

SELECT * FROM T1

delete from T1  where Column_3 between 2 and 20



INSERT T1 VALUES (100,'ahmed');

INSERT T1 (column_2) VALUES ('Row #2');
GO
SET IDENTITY_INSERT T1 ON;
SET IDENTITY_Insert T1 off;
GO


INSERT INTO T1 (column_3,column_1,column_2)  VALUES 
(7,777, 'eman');

truncate table t1

GO
SELECT column_1, column_2,column_3
FROM T1;

drop table T1

dbcc checkident(T1,RESEED,3)

select @@identity

SELECT IDENT_CURRENT('t1')
--------------------------------------------
--insert statments 
--simple insert
--insert constructor
--insert based on select
--insert based on execute
--bulk insert (ene ageb data mn file w 7otha fe gdwl hna)

bulk insert student
from 'F:\ITI\database iti\Day10\00.txt'
with (
fieldterminator =',')

------------------------------------------------------
--snapshot 
--read only db 
/*k2ny ba5od la2tt camera leldb bta3ty fe w2t mo3yn,
-	btt create fadya w byb2a feha mogrd pointers 3la el data elle fel db elle wa5d mnha el snapshot 
-	a5f bkter mn el db
-	22dr a3ml mnha restore w lkn lazm ab2a 3la nfs el server
-	file ss w malhosh mdf wla ldf wla ndf
-	lma a5od snapshot mn db w a3ml nfs el query 3la el original db w el snapshot hla2y nfs el nateg
- awl ma abd2 a3'yr fel db hy7sl 7aga esmha copyon write, y3ny ai row ana 3mlt feh (delete or update) hay5do copy 2bl ma yt3'yr w y7oto as data fel snapshot w yshel el pointer mn el snapshot elle kan byshawr 3la el row da fel DB,
-	lw 3mlt insert l7aga gdeda b3d ma 5dt el snapshot di, el snapshot msh ht7s beha 
- 22dr a3ml kaza snapshot le nfs el db fe aw2at kter mo5lfa 

*/
create database ITIsnap
on
(
name = 'iti',--mdf file
filename = 'F:\ITI\database iti\Day10\itisnap.ss'
)
as snapshot of iti



--create database ITISnap
--on
--(
-- name='iti',   --mdf
-- filename='d:\snap1.ss'
--),
--(
-- name='file2',  --da lw 3ndy kaza file group 
-- filename='d:\snap2.ss'
--),
--(
-- name='file3',
-- filename='d:\snap3.ss'
--)
--as snapshot of ITI
------------------------------------------------
--SQL CLR 
--3lshan aktb ai logic b c# code msln w a3mlo run fel sql k2ny katbo fel sql 
--ast3'l el liberraries w el flexability bta3t el c# 

sp_configure 'clr_enable',1
go
reconfigure
