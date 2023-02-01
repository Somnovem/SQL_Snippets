use[master]
go
create database FruitsVegetables;

use[FruitsVegetables]
go
create table Stats(
[Id] int not null identity(1,1) primary key,
[Name] nvarchar(100) not null,
[Type] varchar(10) not null,
[Color] varchar(50) not null,
[Calories] int not null check ([Calories] > 0));