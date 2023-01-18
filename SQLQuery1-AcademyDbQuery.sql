use [AcademyDb]
go


--1
select 
	LR.[Name] 
from 
	 LectureRooms as LR  join Schedules as S on S.LectureRoomId = LR.Id
	  join Lectures as L on S.LectureId = L.Id 
	  join Teachers as T on L.TeacherId = T.Id
	 where T.[Name] + ' ' + T.[Surname] = 'Edward Hopper'

--2
select 
	A.Surname
from 
	 Assistants as A  join Teachers as T on A.TeacherId = T.Id
	  join Curators as C on C.TeacherId = T.Id
	  join GroupsCurators as GC on GC.CuratorId = C.Id
	  join Groups as G on GC.GroupId = G.Id
	 where G.[Name] = 'F505'

--3
select 
	S.[Name]
from 
	 Subjects as S  join Lectures as L on L.SubjectId = S.Id
	  join Teachers as T on L.TeacherId = T.Id
	  join GroupsLectures as GL on GL.LectureId = L.Id
	  join Groups as G on GL.GroupId = G.Id
	 where T.[Name] + ' ' + T.[Surname] = 'Alex Carmack' and G.[Year] = 5

--4
select 
	T.[Surname]
from 
	 Teachers as T join Lectures as L on L.TeacherId = T.Id
	 join Schedules as S on S.LectureId = L.Id
	 where S.[DayOfWeek] <> 1

--5
select 
	LR.[Name],LR.Building
from 
	LectureRooms as LR join Schedules as S on S.LectureRoomId = LR.Id
where 
	LR.Id not in (
	select 
		LR.Id
	from 
		LectureRooms as LR join Schedules as S on S.LectureRoomId = LR.Id
	where S.[DayOfWeek] = 3 and S.[Week] = 2 and S.[Class] = 3
	)

--6
select 
	T.[Name] + ' ' + T.[Surname] as 'Fullname'
from Teachers as T join Curators as C on C.TeacherId = T.Id
	 join GroupsCurators as GC on GC.CuratorId = C.Id
	 join Groups as G on GC.GroupId = G.Id
	 join Departments as D on G.DepartmentId = D.Id
	 join Faculties as F on D.FacultyId = F.Id
	 where F.[Name] = 'Computer Science'
	 and  D.[Name] <>'Software development'

--7
select 
	LR.Building
from
	LectureRooms as LR join Schedules as S on S.LectureRoomId = LR.Id
	join Lectures as L on S.LectureId = L.Id
	join GroupsLectures as GL on GL.LectureId = L.Id
	join Groups as G on GL.GroupId = G.Id
	join Departments as D on G.DepartmentId = D.Id
	join Faculties as F on D.FacultyId = F.Id
	where LR.Building = D.Building and D.Building = F.Building

--8
select 
	T.[Name]+ ' ' + T.[Surname] as 'Fullname'
from 
	Teachers as T, Deans as D
where 
	D.TeacherId = T.Id
union
select 
	T.[Name]+ ' ' + T.[Surname] as 'Fullname'
from 
	Teachers as T,Departments as D,Heads as H
where 
	D.HeadId = H.Id and H.TeacherId = T.Id
union
select 
	T.[Name]+ ' ' + T.[Surname] as 'Fullname'
from 
	Teachers as T,Curators as C
where 
	C.TeacherId = T.Id
union
select 
	T.[Name]+ ' ' + T.[Surname] as 'Fullname'
from 
	Teachers as T,Assistants as A
where 
	A.TeacherId = T.Id
union 
select 
	T.[Name]+ ' ' + T.[Surname] as 'Fullname'
from 
	Teachers as T

--9
select 
	distinct S.[DayOfWeek]
from 
	Schedules as S join LectureRooms as LR on S.LectureRoomId = LR.Id
where 
	LR.[Name] in('A311','A104')