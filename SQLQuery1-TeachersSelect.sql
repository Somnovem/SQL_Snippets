--select
--	D.[Id],[Department],[Firstname] + ' ' + [Lastname] as 'Fullname'
--from 
--	[Departments] as D,[Teachers] as T 
--where
--	D.Id = T.[Id] and D.[Id] <3 and T.[Firstname] like 'Henry'
--	order by [Department] desc,'Fullname' asc

--select
--	T.[Id],[Firstname] + ' ' + [Lastname] as 'Fullname',D.[Department],TS.*
--from 
--	[Teachers] as T,[TeacherSubject] as TS,[Departments] as D
--where 
--	T.[Id] = TS.[TeacherId] and T.[DepartmentId] = D.[Id]
--order by 
--	[Department]

select S.[Name] as 'Subject name', [Firstname] + ' ' + [Lastname] as 'Fullname', D.Department
from Teachers as T,[TeacherSubject] as TS,[Departments] as D,[Subjects] as S,
where 
	T.[Id] = TS.[TeacherId] and T.[DepartmentId] = D.[Id] and TS.SubjectId = S.ID
order by S.[Name],[Department]