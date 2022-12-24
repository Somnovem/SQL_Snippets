use [Academy]
go

create table [Groups](
  [Id] int not null identity(1,1),
  [Name] nvarchar(10) not null unique,
  [Rating] int not null,
  [Year] int not null,

  constraint PK_Groups_Id primary key([Id]),
  constraint CK_Groups_Name check([Name] <>''),
  constraint CK_Groups_Rating check([Rating] >=0 and [Rating] <=5),
  constraint CK_Groups_Year check([Year] >=1 and [Rating] <=5),
);

create table [Departments](
[Id] int not null identity(1,1),
[Financing] money not null default(0),
[Name] nvarchar(100) not null unique,

constraint PK_Departments_Id primary key([Id]),
constraint CK_Departments_Name check([Name] <>''),
constraint CK_Departments_Financing check([Financing] >=0),
);

create table [Faculties](
[Id] int not null identity(1,1),
[Name] nvarchar(100) not null unique,
[Dean] nvarchar(max) not null,

constraint PK_Faculties_Id primary key([Id]),
constraint CK_Faculties_Name check([Name] <>''),
constraint CK_Faculties_Dean check([Dean]<>'')
);

create table [Teachers](
[Id] int not null identity(1,1),
[EmploymentDate] date not null,
[IsAssistant] bit not null default(0),
[IsProfessor] bit not null default(0),
[Name] nvarchar(max) not null,
[Position] nvarchar(max) not null,
[Surname] nvarchar(max) not null,
[Premium] money not null default(0),
[Salary] money not null,

constraint PK_Teachers_Id primary key([Id]),
constraint CK_Teachers_Name check([Name] <>''),
constraint CK_Teachers_Surname check([Surname] <>''),
constraint CK_Teachers_Position check([Position] <>''),
constraint CK_Teachers_EmploymentDate check([EmploymentDate] >='01.01.1990'),
constraint CK_Teachers_Premium check([Premium] >=0),
constraint CK_Teachers_Salary check([Salary] >0),
);