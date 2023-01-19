use [Hospital]
go
--			PART 1			--
--1
create proc Worlder
as
print('Hello World!')
return 0;

--2
create proc ShowTime
as
select CONVERT(time,getdate()) as 'Current time'
return 0;

--3
create proc ShowDate
as
select CONVERT(date,getdate()) as 'Current date'
return 0;

--4
create proc SumOf3
	@a int = 0,
	@b int = 0,
	@c int = 0,
	@sum int out
as
	set @sum = @a+@b+@c;
	return 0;

--5
create proc AvgOf3
	@a int = 0,
	@b int = 0,
	@c int = 0,
	@sum float out
as
	set @sum = (@a+@b+@c)/3;
	return 0;

----			PART 2			----

--1
create proc ShowAllDoctors
as
	select * from Doctors;
	return 0

--2
create proc ShowAllWardsPerDepartment
as
	select W.[Name],D.[Name]
	from Wards as W, Departments as D
	where W.DepartmentId = D.Id;
	return 0

--3
create proc ShowAllProfessors
as
	select [Name],[Surname]
	from Professors join Doctors on Professors.DoctorId = Doctors.Id
	order by [Surname] asc;
	return 0


--4
create proc ShowObservationOnDate
	@d date
as
	begin
		select E.[Name] as 'Examination name',D.[Name] + D.[Surname] as 'Leading doctor',
		DE.[StartTime],DE.[EndTime],DS.[Name] as 'Name of disease'
		from Examinations as E 
		join DoctorsExaminations as DE on DE.ExaminationId = E.Id
		join Doctors as D on DE.DoctorId = D.Id
		join Diseases as DS on DE.DiseaseId = DS.Id
		where DE.[Date] = @d;
		return 0
	end

--5
create proc ShowObservationInInterval
	@start date,
	@end date
as
	begin
		select	
			E.[Name] as 'Examination name',D.[Name] + D.[Surname] as 'Leading doctor',
			DE.[StartTime],DE.[EndTime],DS.[Name] as 'Name of disease'
		from Examinations as E 
		join DoctorsExaminations as DE on DE.ExaminationId = E.Id
		join Doctors as D on DE.DoctorId = D.Id
		join Diseases as DS on DE.DiseaseId = DS.Id
		where DE.[Date] between @start and @end;
		return 0
	end

--6
create proc ShowObservationsByDoctor
	@firstame nvarchar(100),
	@lastname nvarchar(100)
as
	begin
		select
			E.[Name] as 'Examination name',D.[Name] + D.[Surname] as 'Leading doctor',
			DE.[StartTime],DE.[EndTime],DS.[Name] as 'Name of disease'
		from Examinations as E 
		join DoctorsExaminations as DE on DE.ExaminationId = E.Id
		join Doctors as D on DE.DoctorId = D.Id
		join Diseases as DS on DE.DiseaseId = DS.Id
		where D.[Name] = @firstame and D.[Surname] = @lastname;
		return 0
	end

--7
create proc ShowObservationBuDoctorInYear
	@firstame nvarchar(100) = null,
	@lastname nvarchar(100) = null,
	@year int
as
	begin
	if @firstame = null or @lastname = null
		begin
			select 
				count(*) as 'Total number of examinations'
				from DoctorsExaminations as DE
				where datepart(YEAR,DE.Date) = @year;
				return 0
		end
	else
		begin
			select 
				[Name],[Surname],count(ExaminationId) as 'Number of exams'
			from 
				DoctorsExaminations as DE join Doctors as D on DE.DoctorId = D.Id
			where 
				D.[Name] = @firstame and D.[Surname] = @lastname and datepart(YEAR,DE.[Date]) = @year
			group by [Name],[Surname];
			return 0
		end
	end

create proc NumberOfDiseasesIn
	@type varchar(5),
	@value int
as
	begin
	if @value <1
		begin
			raiserror('Unrealistic number')
			return 1
		end
	else
		begin
			if @type = 'year'
				begin
					select count(*) as 'Number of diseased'
					from DoctorsExaminations as DE
					where datepart(YEAR,DE.[Date]) = @value;
					return 0
				end
			else
				begin
					if @type = 'month'
						begin
							select count(*) as 'Number of diseased'
							from DoctorsExaminations as DE
							where datepart(MONTH,DE.[Date]) = @value;
							return 0
						end
					else
						begin
							raiserror('Type could not be handled',0,1);
							return 1
						end
				end
		end
	end
	