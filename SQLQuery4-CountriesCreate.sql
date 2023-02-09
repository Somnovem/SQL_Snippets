use [master]
go
create database [CountriesDb]
go

use[CountriesDb]
go
create table [Countries]
(
Id int not null identity(1,1) primary key,
[Name] varchar(100) not null,
[Capital] varchar(100) not null,
[Population] int not null,
[Area] int not null,
[Continent] varchar(20) not null
)