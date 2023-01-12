use [Academy]
go

--1
select * from [Teachers],[Groups]

--2
select F.[Name]
from [Faculties] as F,[Departments] as D
where D.[FacultyId] = F.[Id] and D.[Financing] > F.[Financing]

--3
select C.[Name],G.[Name]
from [Curators] as C,[Groups] as G,[GroupsCurators] as GC
where C.[Id] = GC.[CuratorId] and G.[Id] = GC.[GroupId]

--4
select T.[Name] + T.[Surname] as 'Teachers full name'
from [Teachers] as T,[GroupsLectures] as GL,[Groups] as G,[Lectures] as L
where L.[TeacherId] = T.[Id] and GL.[LectureId] = L.[Id] and GL.[GroupId] = G.[Id] and G.[Name]='P107'

--5
select T.[Name] + T.[Surname] as 'Teachers full name', D.[Name]
from [Teachers] as T,[Lectures] as L,[GroupsLectures] as GL,[Groups] as G,[Departments] as D
where T.[Id] = L.[TeacherId] and GL.[LectureId] = L.[Id] and GL.[GroupId] = G.[Id] and G.[DepartmentId] = D.[Id]

--6
select D.[Name],G.[Name]
from [Departments] as D,[Groups] as G
where G.[DepartmentId] = D.[Id]

--7
select S.[Name]
from [Teachers] as T, [Lectures] as L,[Subjects] as S
where L.[TeacherId] = T.[Id] and S.[Id] = L.[SubjectId] and T.[Name] = 'Samantha Adams'

--8
select D.[Name]
from [Departments] as D,[Subjects] as S,[Groups] as G,[GroupsLectures] as GL,[Lectures] as L
where D.[Id] = G.[DepartmentId] and GL.[GroupId] = G.[Id] and L.[Id] = GL.[LectureId] and  L.[SubjectId] = S.[Id] and S.[Name] = 'Database Theory'

--9
select G.[Name]
from [Groups] as G, [Departments] as D, [Faculties] as F
where G.[DepartmentId] = D.[Id] and D.[FacultyId] = F.[Id] and  F.[Name] = 'Computer Science'

--10
select G.[Name],F.[Name]
from [Groups] as G,[Departments] as D,[Faculties] as F
where G.[DepartmentId] = D.[Id] and D.[FacultyId] = F.[Id] and G.[Year] = 5

--11
select T.[Name] + T.[Surname] as 'Teachers full name',S.[Name],G.[Name]
from [Teachers] as T,[Lectures] as L, [Subjects] as S, [Groups] as G,[GroupsLectures] as GL
where L.[TeacherId] = T.[Id] and L.[SubjectId] = S.[Id] and GL.[LectureId] = L.[Id]
	  and GL.[GroupId] = G.[Id] and L.[LectureRoom] = 'B103'