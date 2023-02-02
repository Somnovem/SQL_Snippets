use[master]
go
create database [Warehouse]
go

use[Warehouse]
go

create table Types(
Id int not null identity(1,1) primary key,
[Name] varchar(100) not null);

create table Manufacturers(
Id int not null identity(1,1) primary key,
[Name] varchar(100) not null);

create table Products(
Id int not null identity(1,1) primary key,
[Name] nvarchar(200) not null,
[TypeId] int not null,
[ManufacturerId] int not null,
[Stock] int not null check ([Stock] >=0),
[PrimeCost] money not null,
[DateIn] date not null,
constraint FK_Warehouse_TypeId foreign key([TypeId]) references [Types]([Id]),
constraint FK_Warehouse_ManufacturerId foreign key([ManufacturerId]) references [Manufacturers]([Id]));