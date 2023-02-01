USE [SportsShop]
GO

CREATE ROLE [fullAccess] 
GO
ALTER ROLE [db_owner] add member [fullAccess]
GO

CREATE ROLE [salesman] 
GO
GRANT INSERT ON [dbo].[Products] TO [salesman]
GO
GRANT SELECT ON [dbo].[Products] TO [salesman]
GO
GRANT UPDATE ON [dbo].[Products] TO [salesman]
GO

CREATE ROLE [accountant] AUTHORIZATION [db_datareader]
GO
GRANT ALTER ON [dbo].[Employees] TO [accountant]
GO
GRANT CONTROL ON [dbo].[Employees] TO [accountant]
GO
GRANT DELETE ON [dbo].[Employees] TO [accountant]
GO
GRANT INSERT ON [dbo].[Employees] TO [accountant]
GO
GRANT REFERENCES ON [dbo].[Employees] TO [accountant]
GO
GRANT SELECT ON [dbo].[Employees] TO [accountant]
GO
GRANT UPDATE ON [dbo].[Employees] TO [accountant]
GO

USE [master]
GO
CREATE LOGIN [sportsChef] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [SportsShop]
GO
CREATE USER [sportsChef] FOR LOGIN [sportsChef]
GO
ALTER ROLE [fullAccess] ADD MEMBER [sportsChef]
GO

USE [master]
GO
CREATE LOGIN [sportsDeputy] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [SportsShop]
GO
CREATE USER [sportsDeputy] FOR LOGIN [sportsDeputy]
GO
ALTER ROLE [fullAccess] ADD MEMBER [sportsDeputy]
GO

USE [master]
GO
CREATE LOGIN [sportsAccountant] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER [sportsAccountant] FOR LOGIN [sportsAccountant]
GO
ALTER ROLE [accountant] ADD MEMBER [sportsAccountant]
GO

use [SportsShop]
Go
alter table [Employees]
alter column [Firstname] nvarchar(100) masked with(function='default()');
alter table [Employees]
alter column [Lastname] nvarchar(100) masked with(function='default()');
alter table [Employees]
alter column [Fathersname] nvarchar(100) masked with(function='default()');

USE [master]
GO
CREATE LOGIN [Maxim] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [George] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [Vira] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [Rick] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [SportsShop]
GO
CREATE USER [Maxim] FOR LOGIN [Maxim]
GO
CREATE USER [George] FOR LOGIN [George]
GO
CREATE USER [Vira] FOR LOGIN [Vira]
GO
CREATE USER [Rick] FOR LOGIN [Rick]
GO
ALTER ROLE [salesman] ADD MEMBER [Maxim]
GO
ALTER ROLE [salesman] ADD MEMBER [George]
GO
ALTER ROLE [salesman] ADD MEMBER [Vira]
GO
ALTER ROLE [salesman] ADD MEMBER [Rick]
GO
GRANT UNMASK TO [Maxim]
GO
GRANT UNMASK TO [George]
GO
GRANT UNMASK TO [Vira]
GO
GRANT UNMASK TO [Rick]
GO