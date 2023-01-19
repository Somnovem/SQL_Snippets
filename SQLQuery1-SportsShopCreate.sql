use [master]
go
create database [SportsShop]

use [SportsShop]
go

create table [Categories](
[Id] int not null identity(1,1) primary key,
[Name] nvarchar(200) not null,
constraint CK_Categories_Name check ([Name]<>'')
)

create table [Manufacturers](
[Id] int not null identity(1,1) primary key,
[Name] nvarchar(200) not null,
constraint CK_Manufacturers_Name check ([Name]<>'')
)



create table [Products](
[Id] int not null identity(1,1) primary key,
[Name] nvarchar(200) not null,
[CategoryId] int not null,
[Stock] int not null default(0),
[PrimeCost] money not null,
[ManufacturerId] int not null,
[Price] money not null,

constraint CK_Products_Name check ([Name]<>''),
constraint CK_Products_Stock check ([Stock]>=0),
constraint CK_Products_PrimeCost check ([PrimeCost]>0),
constraint CK_Products_Price check ([Price]>0),
constraint FK_Products_CategoryId foreign key([CategoryId]) references [Categories]([Id]),
constraint FK_Products_ManufacturerId foreign key([ManufacturerId]) references [Manufacturers]([Id])
)

create table [Employees](
[Id] int not null identity(1,1) primary key,
[Firstname] nvarchar(100) not null,
[Lastname] nvarchar(100) not null,
[Fathersname] nvarchar(100) not null,
[DateIn] date not null,
[Gender] varchar(20) not null,
[Salary] money not null,

constraint CK_Employees_Firstname check ([Firstname]<>''),
constraint CK_Employees_Lastname check ([Lastname]<>''),
constraint CK_Employees_Fathersname check ([Fathersname]<>''),
constraint CK_Employees_DateIn check ([DateIn] <= getdate()),
constraint CK_Employees_Gender check ([Gender]<>''),
constraint CK_Employees_Salary check ([Salary]>0)
)

create table [Clients](
[Id] int not null identity(1,1) primary key,
[Firstname] nvarchar(100) not null,
[Lastname] nvarchar(100) not null,
[Fathersname] nvarchar(100) not null,
[Gender] varchar(20) not null,
[Email] varchar(320) not null,
[Phone] varchar(20) not null,
[SalePercent] int not null default(0),
[IsSubscribed] bit not null default(0),


constraint CK_Clients_Firstname check ([Firstname]<>''),
constraint CK_Clients_Lastname check ([Lastname]<>''),
constraint CK_Clients_Fathersname check ([Fathersname]<>''),
constraint CK_Clients_Gender check ([Gender]<>''),
constraint CK_Clients_Email check ([Email]<>''),
constraint CK_Clients_Phone check ([Phone]<>'' and IsNumeric([Phone]) = 1),
constraint CK_Clients_SalePercent check ([SalePercent] between 0 and 100),
)


create table [Sales](
[Id] int not null identity(1,1) primary key,
[ProductId] int not null,
[NumberSold] int not null default(0),
[DateSold] date not null,
[EmployeeId] int not null,
[ClientId] int not null,

constraint FK_Sales_ProductId foreign key([ProductId]) references [Products]([Id]),
constraint FK_Sales_EmployeeId foreign key([EmployeeId]) references [Employees]([Id]),
constraint FK_Sales_ClientId foreign key([ClientId]) references [Clients]([Id]),
constraint CK_Sales_NumberSold check ([NumberSold] >=0),
constraint CK_Sales_DateSold check ([DateSold] <= getdate()),
)

create table [History](
[Id] int not null identity(1,1) primary key,
[ProductId] int not null,
[NumberSold] int not null default(0),
[DateSold] date not null,
[EmployeeId] int not null,
[ClientId] int not null,

constraint FK_History_ProductId foreign key([ProductId]) references [Products]([Id]),
constraint FK_History_EmployeeId foreign key([EmployeeId]) references [Employees]([Id]),
constraint FK_History_ClientId foreign key([ClientId]) references [Clients]([Id]),
constraint CK_History_NumberSold check ([NumberSold] >=0),
constraint CK_History_DateSold check ([DateSold] <= getdate())
)

create table [Archive](
[Id] int not null identity(1,1) primary key,
[Name] nvarchar(200) not null,
[CategoryId] int not null,
[PrimeCost] money not null,
[ManufacturerId] int not null,
[Price] money not null,

constraint CK_Archive_Name check ([Name]<>''),
constraint CK_Archive_PrimeCost check ([PrimeCost]>0),
constraint CK_Archive_Price check ([Price]>0),
constraint FK_Archive_CategoryId foreign key([CategoryId]) references [Categories]([Id]),
constraint FK_Archive_ManufacturerId foreign key([ManufacturerId]) references [Manufacturers]([Id])
)