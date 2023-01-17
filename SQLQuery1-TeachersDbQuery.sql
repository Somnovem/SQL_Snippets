use [TeachersDb]
go

select
	Id,Firstname + ' ' + Lastname as 'Fullname',Birthdate
from
	Students
where
	not exists(
		select *
		from Achievements
		where Achievements.StudentId = Students.Id
	)

select
	Id,Firstname + ' ' + Lastname as 'Fullname',Birthdate
from
	Students
where
	-- Id in(
	 Id = any(
		select StudentId
		from Achievements
		where Achievements.Assesment =10
	)

--[any]=[some]
--[in] handles ranges, both dynamic and static

select
	count(*) as 'Number of students'
from
	Students
where
	BirthDate < any(
		select Birthdate from Teachers
	)

select
	S.Id,S.Firstname + ' ' + S.Lastname as 'Fullname',S.Birthdate,A.Assesment
from
	Students as S, Achievements as A
	where S.Id = A.StudentId and
	  A.Assesment > all(
	  select avg(Assesment)
	  from Achievements
	  group by Achievements.StudentId
	  )

select Firstname,Lastname,Assesment
from Students as S,(
	select StudentId,Assesment
	from Achievements
	group by StudentId,Assesment
	having Assesment <> all(
		select Assesment
		from Groups as G,Students as S,Achievements as A
		where S.GroupId = G.Id
			and A.StudentId = S.Id
			and G.[Name] = '30PR11')
	) as SA
where SA.StudentId = S.Id


select
	count(*) as 'Number of students'
from
	Students
where
	BirthDate > any(
		select Birthdate from Teachers where BirthDate > getdate()
	)

-- any,some and all only work with subqueries
--exists returns whether there is response from query other than null
-- any,some return false when 0 mathes in query, all returns true

--to get a list of fullnames and birthdates of all students and teachers
select LastName,FirstName,BirthDate from Students
union all
select LastName,FirstName,BirthDate from Teachers
order by [Lastname]

-- union ignores the row if there is a copy, so if you need all of the possible rows, use union all

select LastName,FirstName,BirthDate from Students
where MONTH(BirthDate) between 6 and 8
union all
select LastName,FirstName,BirthDate from Teachers
where MONTH(BirthDate) between 6 and 8
order by [BirthDate]

select 'Students' as 'In Summer',count(*) as 'Count' from Students
where MONTH(BirthDate) between 6 and 8
union all
select 'Teachers',count(*) from Teachers
where MONTH(BirthDate) between 6 and 8
union all
select 'All',sum(AllSum.AllCount)
from(
	select count(*) as 'AllCount' from Students
	where MONTH(BirthDate) between 6 and 8
	union all
	select count(*) from Teachers
	where MONTH(BirthDate) between 6 and 8
	) as AllSum
