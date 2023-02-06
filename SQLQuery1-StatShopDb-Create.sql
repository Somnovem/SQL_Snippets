use [StationeryShopDb]
go
create table [Types]
(
Id int not null identity(1,1)primary key,
[Name] varchar(100) not null
);

create table [Firms]
(
Id int not null identity(1,1)primary key,
[Name] varchar(200) not null,
[Phone] varchar(20),
[Country] varchar(100) not null,
[Adress] varchar(max) not null
);

create table [Sellers]
(
Id int not null identity(1,1)primary key,
Lastname nvarchar(100) not null,
Firstname nvarchar(100) not null,
Birthdate date not null,
DateIn date not null
);

create table [Products]
(
Id int not null identity(1,1)primary key,
[Name] varchar(200) not null,
Stock int not null,
PrimeCost money not null,
Price money not null,
TypeId int not null,
constraint FK_Products_TypeId foreign key([TypeId]) references [Types]([Id]),
);

create table [Sales]
(
Id int not null identity(1,1)primary key,
ProductId int not null,
SellerId int not null,
NumberSold int not null,
FirmId int not null,
SellDate date not null,
constraint FK_Sales_TypeId foreign key([ProductId]) references [Products]([Id]),
constraint FK_Sales_FirmId foreign key([FirmId]) references [Firms]([Id]),
constraint FK_Sales_SellerId foreign key([SellerId]) references [Sellers]([Id])
);