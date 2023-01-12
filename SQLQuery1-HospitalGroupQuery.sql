use [Hospital]
go

--1
select COUNT(W.[Id]) as 'Number of wards'
from [Wards] as W
where W.[Places] > 10

--2
select D.[Building] as 'Building',COUNT(W.[Name]) as 'Number of wards'
from [Departments] as D,[Wards] as W
where W.[DepartmentId] = D.[Id]
group by D.[Name]

--3
select D.[Name] as 'Department name',COUNT(W.[Name]) as 'Number of wards'
from [Departments] as D,[Wards] as W
where W.[DepartmentId] = D.[Id]
group by D.[Name]

--4
select D.[Name] as 'Department name',SUM(DC.Premium) as 'Total premium per department'
from [Departments] as D,[Wards] as W,[Doctors] as DC
where W.[DepartmentId] = D.[Id] and DC.[DepartmentId] = D.[Id]
group by D.[Name]

--5
select D.[Name] as 'Department name'
from [Departments] as D,[Wards] as W,[Doctors] as DC,[DoctorsExaminations] as DE
where DE.[DoctorId] = D.[Id] and DE.[WardId] = W.[Id] and W.[DepartmentId] = D.[Id]
group by D.[Name]
having count(DC.[Id]) >= 5

--6
select COUNT(*) as 'Number of Doctors',SUM(DC.[Premium] + DC.[Salary]) as 'Total wage'
from [Doctors] as DC

--7
select AVG(DC.[Premium] + DC.[Salary]) as 'Average wage'
from [Doctors] as DC

--8
select W.[Name] as 'Ward name'
from [Wards] as W
where W.Places = Min(W.Places)

--9
select D.[Name] as 'Department name'
from [Wards] as W, [Departments] as D
where W.[DepartmentId] = D.[Id] and W.Places > 10 and D.[Building] in (1,6,7,8)
group by D.[Name]
having SUM(W.[Places]) > 100