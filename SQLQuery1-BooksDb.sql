use BooksDb
go

create table Publishers(
	[Id] int not null identity(1,1) primary key,
	[Name] nvarchar(100) not null check([Name]<>''),
	[Country] nvarchar(100) not null check([Country]<>''),
	[Phone] varchar(15)
);

create table Genres(
	[Id] int not null identity(1,1) primary key,
	[Name] nvarchar(100) not null check([Name]<>''),
);

create table Authors(
	[Id] int not null identity(1,1),
	[Firstname] nvarchar(100) not null ,
	[Middlename] nvarchar(100),
	[Lastname] nvarchar(100) not null,
	[Country] nvarchar(100) not null,
	[Birth] date not null,
	--[Email] varchar(200) not null unique check([Email]<>''),

	constraint PK_Authors_Id primary key ([Id]),
	constraint CK_Authors_Firstname check([Firstname] <>''),
	constraint CK_Authors_Lastname check([Lastname] <>''),
	constraint CK_Authors_Country check([Country] <>''),
	constraint CK_Authors_Birth check([Birth] < getdate())
);

create table Books(
	[Id] int not null identity(1,1),
	[ISDN] nvarchar(100) not null,
	[Name] nvarchar(100) not null,
	[Pages] tinyint not null,
	[Release] date not null,
	[Aqcuire] date not null default(getdate()),
	[Price] money not null,
	[AuthorId] int not null references [Authors]([Id]),
	[PublisherId] int not null ,--references [Publishers]([Id]),
	[GenreId] int not null,-- references [Genres]([Id]),


	constraint PK_Books_Id primary key ([Id]),
	constraint CK_Books_Firstname check([Name] <>''),
	constraint CK_Books_Pages check([Pages] > 0),
	constraint CK_Books_Price check([Price] > 0),
	constraint CK_Books_Release check([Release] <=getdate()),
	constraint CK_Books_Aqcuire check([Aqcuire] <=getdate()),
	constraint FK_Books_Publishers foreign key ([PublisherId]) references [Publishers]([Id]),
	constraint FK_Books_Genres foreign key ([GenreId]) references [Genres]([Id]),
);