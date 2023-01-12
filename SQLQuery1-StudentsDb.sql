use [Students]
go

create table [Specs](

	[Id] int not null identity(1,1) primary key,
	[Name] nvarchar(100) not null check([Name]<>'')

)

create table [Groups](
	[Id] int not null identity(1,1) primary key,
	[Group] varchar(10) not null,
	[Course] tinyint not null check([Course] >=1 AND [Course]<=5),
	[SpecId] int not null references [Specs]([Id])
)

create table [Address](
	[Id] int not null identity(1,1) primary key,
	[Country] varchar(30) not null,
	[Region] varchar(30) null,
	[City] nvarchar(100) not null,
	[Street] nvarchar(100) not null,
	[House] tinyint not null,
	[Flat] tinyint null
)

create table [Students](
	[Code] int not null identity(1,1) primary key,
	[Firstname] nvarchar(20) not null check([Firstname]<>''),
	[Lastname] nvarchar(20) not null check([Lastname]<>''),
	[Fathersname] nvarchar(40) not null check([Fathersname]<>''),
	[AdressId] int not null references [Address]([Id]),
	[Birthdate] date not null check([Birthdate] < getdate()),
	[DateIn] date not null check([DateIn] < getdate()),
	[GroupId] int not null references [Groups]([Id])
)
