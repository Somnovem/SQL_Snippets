use [Academy]
go

select [Name],[Financing],[Id] from Departments

select [Name] as[Group Name],[Rating] as[Group Rating] from [Groups]

select [Surname],(Salary / Premium * 100) as [First Percent],(Salary / (Salary+Premium) * 100) as [Second Percent] from [Teachers]

select ('The dean of faculty '+[Name]+' is '+[Dean]) as [Faculties Analysis] from [Faculties]

select [Surname] from Teachers where ([IsProfessor] = 1 and [Salary] > 1050)

select [Name] from [Departments] where ([Financing] < 11000 or [Financing] > 25000)

select [Name] from [Faculties] where ([Name] <>'Computer Science')

select [Name],[Position] from [Teachers] where ([IsProfessor] = 0)

select [Surname],[Position],[Salary],[Premium] from Teachers where([IsAssistant] = 1 and [Premium] >=160 and [Premium] <=550)

select [Surname],[Salary] from [Teachers] where([IsAssistant] = 1)

select [Surname],[Position] from [Teachers] where ([EmploymentDate]<'01.01.2000') 

select [Name] as [Name of Department] from Departments where ([Name] <'Software Development') order by [Name] asc

select [Surname] from Teachers where(([Salary]+[Premium])<=1200 and [IsAssistant]=1)

select [Name] from Groups where([Year]=5 and [Rating]>=2 and [Rating]<=4)

select [Surname] from[Teachers] where([IsAssistant] = 1 and ([Salary] <550 or [Premium] < 200))