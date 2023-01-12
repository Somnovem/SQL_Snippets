use [Hospital]
go

--1
select Doc.[Name] + ' ' + Doc.[Surname] as 'Fullname', S.[Name] as 'Specialization'
from [Doctors] as Doc,[DoctorsSpecializations] as DS, [Specializations] as S
where Doc.[Id] = DS.[DoctorId] and S.[Id] = DS.[SpecializationId]

--2
select Doc.[Surname], Doc.[Premium] + Doc.[Salary] as 'Wage'
from [Doctors] as Doc,[Vacations] as V
where Doc.[Id] = V.[DoctorId] and V.[EndDate] < getdate()

--3
select W.[Name]
from [Wards] as W,[Departments] as D
where W.[DepartmentId] = D.[Id] and D.[Name] = 'Intensive Treatment'

--4
select distinct D.[Name]
from [Departments] as D,[Sponsors] as S,[Donations] as Don
where D.[Id] = Don.[DepartmentId] and S.[Id] = Don.[SponsorId] and S.[Name] = 'Umbrella Corporation'

--5
select D.[Name],S.[Name],Don.[Amount],Don.[Date]
from [Donations] as Don,[Departments] as D,[Sponsors] as S
where D.[Id] = Don.[DepartmentId] and S.[Id] = Don.[SponsorId] and DATEDIFF(month,getdate(),Don.[Date])=0

--6
select Doc.[Name],D.[Name]
from [Doctors] as Doc,[Departments] as D,[DoctorsExaminations] as DE, [Wards] as W
where Doc.[Id] = DE.[DoctorId] and DE.[WardId] =  W.[Id]

--7
select W.[Name],D.[Name]
from [Doctors] as DC,[Departments] as D, [DoctorsExaminations] as DE,[Wards]as W
where DC.[Id] = DE.[DoctorId] and de.[WardId] = w.[Id] and dc.[Name]='Helen Williams'

--8
select D.[Name], Dc.[Name] + Dc.[Surname] as 'Doctors name'
from [Doctors] as DC,[Departments]as D,[Donations] as DN
where DC.[DepartmentId] = D.[Id] AND DN.[DepartmentId] = D.[Id] and dn.[Amount] > 100000

--9
select distinct D.[Name]
from [Departments]as D, [Doctors] as DC
where DC.[DepartmentId] = D.[Id] and DC.[Premium] = 0

--10
select DI.[Name]
from [Diseases] as DI,[Specializations] as S
where Di.[SpecializationId] = S.[Id] and DI.[severity]>3

--11
select D.[Name], Di.[Name]
from [Departments] as D,[DoctorsExaminations] as DE,[Diseases] as DI,[Wards] as W
where W.[DepartmentId] = D.[Id] AND W.[Id] = DE.[WardId] and DATEDIFF(month,GETDATE(),DE.[StartTime])<=6

--12
select D.[Name],W.[Name]
from [Departments] as D,[Wards]as W,[DoctorsExaminations] as DE, [Diseases] as DI
where W.[DepartmentId] = D.[Id] and DE.[WardId] = W.[Id] and DE.[DiseaseId] = DI.[Id] and DI.[IsInfective] = 1