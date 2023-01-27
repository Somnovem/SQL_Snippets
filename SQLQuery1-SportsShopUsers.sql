--------1---------
USE [master]
GO

CREATE LOGIN [Mark] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [SportsShop]
GO

CREATE USER [Mark] FOR LOGIN [Mark]
GO

ALTER USER [Mark] WITH DEFAULT_SCHEMA=[db_datareader]
GO

ALTER ROLE [db_datareader] ADD MEMBER [Mark]
GO

DENY SELECT ON [dbo].[Employees] TO [Mark]
GO

--------2---------
USE [master]
GO

CREATE LOGIN [David] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO


USE [SportsShop]
GO

CREATE USER [David] FOR LOGIN [David]
GO

ALTER USER [David] WITH DEFAULT_SCHEMA=[db_datareader]
GO

ALTER ROLE [db_datareader] ADD MEMBER [David]
GO


DENY SELECT ON [dbo].[Archive] TO [David]
GO

DENY SELECT ON [dbo].[Manufacturers] TO [David]
GO

DENY SELECT ON [dbo].[Sales] TO [David]
GO

DENY SELECT ON [dbo].[sysdiagrams] TO [David]
GO

DENY SELECT ON [dbo].[Categories] TO [David]
GO

DENY SELECT ON [dbo].[Products] TO [David]
GO

DENY SELECT ON [dbo].[Clients] TO [David]
GO

DENY SELECT ON [dbo].[History] TO [David]
GO


--------3---------
USE [master]
GO

CREATE LOGIN [Olga] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [SportsShop]
GO

CREATE USER [Olga] FOR LOGIN [Olga]
GO

ALTER USER [Olga] WITH DEFAULT_SCHEMA=[db_owner]
GO

ALTER ROLE [db_owner] ADD MEMBER [Olga]
GO


--------4---------
USE [master]
GO
CREATE LOGIN [Constantine] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[SportsShop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [SportsShop]
GO
CREATE USER [Constantine] FOR LOGIN [Constantine]
GO
USE [SportsShop]
GO
ALTER USER [Constantine] WITH DEFAULT_SCHEMA=[db_datareader]
GO
USE [SportsShop]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Constantine]
GO

DENY ALL ON [dbo].[Archive] TO LOGIN [Constantine]
GO
DENY ALL ON [dbo].[Manufacturers] TO LOGIN [Constantine]
GO
DENY ALL ON [dbo].[Sales] TO LOGIN [Constantine]
GO
DENY ALL ON [dbo].[sysdiagrams] TO LOGIN [Constantine]
GO
DENY ALL ON [dbo].[Categories] TO LOGIN [Constantine]
GO
DENY ALL ON [dbo].[Products] TO LOGIN [Constantine]
GO
DENY ALL ON [dbo].[History] TO LOGIN [Constantine]
GO
DENY ALL ON [dbo].[Clients] TO LOGIN [Constantine]
GO
DENY ALL ON [dbo].[Employees] TO LOGIN [Constantine]
GO
GRANT SELECT ON [dbo].[Employees] TO LOGIN [Constantine]
GO