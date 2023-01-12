use [Academy]
go

--1
select 
	count(T.[Name]) as 'Number of teachers'
from 
	[Teachers] as T,[Lectures] as L,[GroupsLectures] as GL,[Groups] as G,
	[Departments] as D
where 
	L.[TeacherId] =T.[Id] and GL.[LectureId] = L.[Id] and GL.[GroupId] = G.[Id]
	and G.[DepartmentId] = D.[Id] and D.[Name] = 'Software development'

--2
select
	count(L.[Id]) as 'Number of lectures'
from
	[Lectures] as L,[Teachers] as T
where
	L.[TeacherId] = T.[Id] and T.[Name] = 'Dave McQueen'

--3
select
	count(L.[Id]) as 'Number of lectures'
from 
	[Lectures] as L
where
	L.[LectureRoom] = 'D201'

--4
select 
	L.[LectureRoom] as 'Lecture room',count(L.[Id]) as 'Number of lectures'
from 
	[Lectures] as L
group by 
	L.[LectureRoom]

--5
select 
	Sum(G.[Students]) as 'Number of students'
from 
	[Teachers] as T,[Lectures] as L,[GroupsLectures] as GL,[Groups] as G
where 
	L.[TeacherId] = T.[Id] and GL.[LectureId] = L.[Id] and GL.[GroupId] = G.[Id] 
	and T.[Name] = 'Jack Underhill'

--6
select 
	AVG(T.[Salary]) as 'Average salary'
from 
	[Teachers] as T,[Lectures] as L,[GroupsLectures] as GL,[Groups] as G,
	[Departments] as D,[Faculties] as F
where 
	T.[Id] = L.[TeacherId] and GL.[LectureId] = L.[Id] and GL.[GroupId] = G.[Id] 
	and G.[DepartmentId] = D.[Id] and D.[FacultyId] = F.[Id] 
	and F.[Name] = 'Computer Science'

--7
select 
	MIN(G.[Students]) as 'Minimum',MAX(G.[Students]) as 'Maximum'
from 
	[Groups] as G

--8
select 
	AVG(D.[Financing]) as 'Average financing'
from 
	[Departments] as D

--9
select 
	T.[Name] + ' ' + T.[Surname] as 'Fullname',count(S.[Id]) as 'Number of subjects'
from 
	[Teachers] as T,[Lectures] as L,[Subjects] as S
where 
	T.[Id] = L.[TeacherId] and L.[SubjectId] = S.[Id]
group by 
	'Fullname'

--10
select 
	GL.[DayOfWeek] as 'Day of week', count(L.[Id])
from 
	[Lectures] as L, [GroupsLectures] as GL
group by 
	GL.[DayOfWeek]
order by
	GL.[DayOfWeek] asc

--11
select 
	L.[LectureRoom] as 'Lecture room',COUNT(D.[Id]) as 'Number of departments'
from 
	[Departments] as D,[Lectures] as L,[GroupsLectures] as GL,[Groups] as G
where
	D.[Id] = G.[DepartmentId] and G.[Id] = GL.[GroupId] and GL.[LectureId] = L.[Id]
group by
	L.[LectureRoom]
order by
	L.[LectureRoom] asc

--12
select 
	F.[Name] as 'Faculties name',COUNT(S.[Id]) as 'Number of subjects'
from 
	[Departments] as D,[Lectures] as L,[GroupsLectures] as GL,[Groups] as G,
	[Faculties] as F, [Subjects] as S
where 
	D.[Id] = G.[DepartmentId] and G.[Id] = GL.[GroupId] and GL.[LectureId] = L.[Id] 
	and D.[FacultyId] = F.[Id] and L.[SubjectId] = S.[Id]
group by 
	F.[Name]

--13
select 
	T.[Name] + ' ' + T.[Surname] as 'Fullname',
	L.[LectureRoom] as 'Lecture room',
	count(L.[Id])
from 
	[Teachers] as T,[Lectures] as L
where 
	L.[TeacherId] = T.[Id]
group by 
	'Fullname',
	L.[LectureRoom]