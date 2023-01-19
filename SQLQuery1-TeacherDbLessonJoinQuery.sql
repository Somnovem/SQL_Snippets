--select * from Teachers,Departments where Teachers.DepartmentId = Departments.Id
--select S.Id as 'StudentId',S.FirstName + ' ' + S.LastName as 'Fullname',S.BirthDate,
--	   G.[Name] as 'Groupname',F.[Name] as 'Faculty',A.Assesment
--from
--	Students as S
--	join Groups as G on S.GroupId = G.Id
--	join Faculties as F on F.Id = G.FacultyId
--	join Achievements as A on S.Id = A.StudentId

--select S.Id as 'StudentId',S.FirstName + ' ' + S.LastName as 'Fullname',S.BirthDate,A.Assesment
--from Students as S
--	left join Achievements as A on S.Id = A.StudentId

--select S.Id as 'StudentId',S.FirstName + ' ' + S.LastName as 'Fullname',S.BirthDate,A.Assesment
--from Achievements as A
--	right join Students as S on S.Id = A.StudentId




--select S.FirstName + ' ' + S.LastName as 'Fullname'
--from Students as S
--	where Id not in (select distinct Achievements.StudentId from Achievements)

--select S.FirstName + ' ' + S.LastName as 'Fullname'
--from Students as S
--	 left join Achievements as A on S.Id = A.StudentId
--	where A.Assesment is null




--select 
--	S.[Name] as 'Subject',T.FirstName + ' ' + T.LastName as 'Fullname'
--from
--	TeacherSubject as TS left join Teachers as T on TS.TeacherId = T.Id
--	right join Subjects as S on TS.SubjectId = S.Id
--order by S.[Name]





-- drop view StudentAssesment -- deleting
--alter view StudentAssesment -- need to write new fromm scratch

--create view StudentAssesment
--with encryption
--as select S.Id as 'StudentId',S.FirstName + ' ' + S.LastName as 'Fullname',S.BirthDate,
--	   G.[Name] as 'Groupname',F.[Name] as 'Faculty',A.Assesment
--from Students as S join Groups as G on S.GroupId = G.Id
--	join Faculties as F on F.Id = G.FacultyId
--	join Achievements as A on S.Id = A.StudentId

--with check option

--select * from StudentAssesment

--create view StudentsWithoutAssesments([GroupName],[Fullname])
--as select G.[Name],S.FirstName + ' ' + S.LastName
--from Students as S join Groups G on S.[GroupId]  =G.Id
--	where S.Id not in (select distinct Achievements.StudentId from Achievements)

--select * from StudentsWithoutAssesments

--create view StudentsInsertAllow
--as
--	select FirstName,LastName,BirthDate
--	from Students

--select * from StudentsInsertAllow
--insert into StudentsInsertAllow values('John','Smith','1990-01-01')
--update StudentsInsertAllow set BirthDate = '1991-01-01' where FirstName = 'John' and LastName = 'Smith'
--delete from StudentsInsertAllow where FirstName = 'John' and LastName = 'Smith'

--create
--alter view Students1998
--as
--	select FirstName,LastName,BirthDate
--	from Students where BirthDate<='1998-01-01'
--	with check option;


--select * from Students1998
--insert into Students1998 values('John','Smith','1999-01-01') -- now gives an error ,[with check option] prevents adding through filter
															   --to a table with filter

--create view AllSumView
--as select 'Students' as 'In Summer',count(*) as 'Count' from Students
--where MONTH(BirthDate) between 6 and 8
--union all
--select 'Teachers',count(*) from Teachers
--where MONTH(BirthDate) between 6 and 8
--union all
--select 'All',sum(AllSum.AllCount)
--from(
--	select count(*) as 'AllCount' from Students
--	where MONTH(BirthDate) between 6 and 8
--	union all
--	select count(*) from Teachers
--	where MONTH(BirthDate) between 6 and 8
--	) as AllSum
--with check option;

--select * from AllSumView;