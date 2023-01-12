use [Books]
go

create table [Izds](

	[Id] int not null identity(1,1) primary key,
	[Name] nvarchar(100) not null check ([Name]<>'')

)

create table[Formats](

	[Id] int not null identity(1,1) primary key,
	[Name] nvarchar(50) not null check ([Name]<>'')

)

create table [Categories](

	[Id] int not null identity(1,1) primary key,
	[Name] nvarchar(40) not null check ([Name]<>'')

)

create table [Press](

	[Id] int not null identity(1,1) primary key,
	[Name] nvarchar(100) not null check ([Name]<>'')

)

create table [Themes](

	[Id] int not null identity(1,1) primary key,
	[Name] nvarchar(40) not null check ([Name]<>'')

)

create table [Books](

	[Id] int not null identity(1,1) primary key,
	[Name] nvarchar(100) not null check ([Name]<>''),
	[Price] money not null check([Price]>0),
	[PressId] int not null,
	[IzdId] int not null,
	[Pages] smallint not null check([Pages] >0),
	[Date] date not null check([Date] < getdate()),
	[Pressrun] smallint not null check([Pressrun] > 1000),
	[CategoryId] int not null,
	[FormatId] int not null,
	[ThemeId] int not null,


	constraint FK_Books_IzdId foreign key([IzdId]) references [Izds]([Id]),
	constraint FK_Books_Format foreign key([FormatId]) references [Formats]([Id]),
	constraint FK_Books_Category foreign key([CategoryId]) references [Categories]([Id]),
	constraint FK_Books_Press foreign key([PressId]) references [Press]([Id]),
	constraint FK_Books_Theme foreign key([ThemeId]) references [Themes]([Id])

)