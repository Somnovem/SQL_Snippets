--create function GetSudentsCount()
--returns int
----with encryption
--as
--begin
--	--body
--	declare @c int
--	select @c = count(*) from Students;
--	return @c -- returned value 
--end


--select dbo.GetStudentsCount() as 'Students count';

--create function GetSubjectCount(@firstname nvarchar(100),@lastname nvarchar(100))
--returns int
--as
--begin
--	return (
--	select count(*)
--	from Teachers as T join TeacherSubject as TS on TS.TeacherId = T.Id
--	join Subjects as S on TS.SubjectId = S.Id
--	where FirstName = @firstname and LastName = @lastname
--	)
--end

--select dbo.GetSubjectCount('Emma','Kirk') as 'Number of subjects'


--acts like a procedure
--declare @i int
--exec @i = dbo.GetSubjectCount 'Emma','Kirk'
--select @i as 'Number of subjects'

--deletes like the rest
--drop function dbo.GetSubjectCount

--alters like the rest,by overriding
--alter function GetSubjectCount(@firstname nvarchar(100),@lastname nvarchar(100))
--returns int
--as
--begin
--	return (
--	select count(*)
--	from Teachers as T join TeacherSubject as TS on TS.TeacherId = T.Id
--	join Subjects as S on TS.SubjectId = S.Id
--	where FirstName = @firstname and LastName = @lastname
--	)
--end

--create function GetStudentByGroup(@groupName nvarchar(40) = default)
--create function GetStudentByGroup(@groupName nvarchar(40) = 'test')
--create function GetStudentByGroup(@groupName nvarchar(40))
--returns table
--as
--	return(select S.FirstName + ' ' + S.LastName as 'Fullname',S.BirthDate,s.Grants as 'Grant'
--	from Students as S 
--	join Groups as G on S.GroupId = G.Id
--	where G.[Name] = @groupName)

--select * from dbo.GetStudentByGroup('29PR21')



--info about all teachers and students
--fullname,birthdate
--create function GetAllPeople()
--returns @table table (Fullname nvarchar(200),Birthdate date)
--as
--begin
--	insert into @table
--	select S.Firstname + ' ' + S.Lastname,S.BirthDate
--	from Students as S;

--	insert into @table
--	select T.Firstname + ' ' + T.Lastname,T.BirthDate
--	from Teachers as T;
--return
--end

--select * from dbo.GetAllPeople() order by Fullname

create function GreetName(@name nvarchar(100))
returns nvarchar(110)
as
begin
return 'Hello, ' + @name + '!'
end


select dbo.GreetName('David') as 'Greetings'

create function GetCurrentMinutes()
returns tinyint
as
begin
return datepart(MINUTE,getdate())
end

select dbo.GetCurrentMinutes() as 'Current minutes'

create function GetCurrentYear()
returns smallint
as
begin
return datepart(YEAR,getdate())
end

select dbo.GetCurrentYear() as 'Current year'

create function IsYearEven(@year int)
returns bit
as
begin
if @year % 2 = 0
	return 1;
return 0;
end

select dbo.IsYearEven(2022) as 'Is year even'

create function IsGivenNumberPrime(@number int)
returns varchar(3)
as
begin
	if @number <=0 return 'no';
	declare @counter int
	set @counter = 2
	while(@counter < @number)
	begin
		if @number % @counter = 0 
			return 'yes';
		set @counter = @counter + 1
	end
	return 'no';
end

select dbo.IsGivenNumberPrime(6) as 'Is number prime'

alter function SumOfMinAndMaxOfFive(@first float,@second float,
@third float,@fourth float,@fifth float)
returns float
as
begin
declare @table table (Number float)
insert into @table values (@first),(@second),(@third),(@fourth),(@fifth)
declare @minimum float,@maximum float
--set @minimum = (select min(Number) from @table)
--set @maximum = (select max(Number) from @table)
select @minimum = min(Number),@maximum = max(Number) from @table
return @minimum + @maximum
end

select dbo.SumOfMinAndMaxOfFive(1,2,3,4,5) as 'Sum of min and max'