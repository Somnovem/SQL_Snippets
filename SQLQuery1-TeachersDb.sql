use [TeachersDb]
go

create table [Departments](
Id int not null identity(1,1) primary key,
Department nvarchar(100) not null check([Department] <>''),
Phone varchar(15) not null check([Phone] <>'')
)

create table [Teachers](
Id int not null identity(1,1) primary key,
Firstname nvarchar(100) not null check([Firstname] <>''),
Lastname nvarchar(100) not null check([Lastname] <>''),
Birthdate date not null,
DepartmentId int not null references [Departments]([Id])
)

create table [GroupSubject](
[Id] int not null identity(1,1) primary key,
[Group] nvarchar(30) not null check([Group] <>''),
[Subject] nvarchar(100) not null check([Subject] <>''),
[TeacherId] int not null,

constraint FK_Teachers_GroupSubject foreign key([TeacherId]) references [Teachers]([Id])
)