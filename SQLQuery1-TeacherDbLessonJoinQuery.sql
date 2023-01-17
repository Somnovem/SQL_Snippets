--select * from Teachers,Departments where Teachers.DepartmentId = Departments.Id
select S.Id as 'StudentId',S.FirstName + ' ' + S.LastName as 'Fullname',S.BirthDate,
	   G.[Name] as 'Groupname',F.[Name] as 'Faculty',A.Assesment
from
	Students as S
	join Groups as G on S.GroupId = G.Id
	join Faculties as F on F.Id = G.FacultyId
	join Achievements as A on S.Id = A.StudentId

select S.Id as 'StudentId',S.FirstName + ' ' + S.LastName as 'Fullname',S.BirthDate,A.Assesment
from Students as S
	left join Achievements as A on S.Id = A.StudentId

select S.Id as 'StudentId',S.FirstName + ' ' + S.LastName as 'Fullname',S.BirthDate,A.Assesment
from Achievements as A
	right join Students as S on S.Id = A.StudentId




select S.FirstName + ' ' + S.LastName as 'Fullname'
from Students as S
	where Id not in (select distinct Achievements.StudentId from Achievements)

select S.FirstName + ' ' + S.LastName as 'Fullname'
from Students as S
	 left join Achievements as A on S.Id = A.StudentId
	where A.Assesment is null




select 
	S.[Name] as 'Subject',T.FirstName + ' ' + T.LastName as 'Fullname'
from
	TeacherSubject as TS left join Teachers as T on TS.TeacherId = T.Id
	right join Subjects as S on TS.SubjectId = S.Id
order by S.[Name]

select
	S.FirstName + ' ' + S.LastName as 'Fullname'
from
	Students as S full join Groups as G on S.GroupId = G.Id 