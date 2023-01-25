use [SportsShop]
go

--1
create function MinimalSaleByName(
	@firstname nvarchar(100),
	@lastname nvarchar(100),
	@fathersname nvarchar(100))
returns @table table(ProductName nvarchar(200),NumberSold int,DateSold date,ClientId int,MinimalSale money)
as
begin
	insert into @table
	select P.[Name],S.[NumberSold],S.[DateSold],S.[ClientId],min(S.NumberSold * P.Price)
	from Employees as E 
	join Sales as S on S.EmployeeId = E.Id
	join Products as P on S.ProductId = P.Id
	where E.Firstname = @firstname and E.Lastname = @lastname
	and E.Fathersname = @fathersname
	group by P.[Name],S.[NumberSold],S.[DateSold],S.[ClientId];
	return
end

--2
create function MinimalBuyByName(
	@firstname nvarchar(100),
	@lastname nvarchar(100),
	@fathersname nvarchar(100))
returns @table table(ProductName nvarchar(200),NumberSold int,DateSold date,ClientId int,MinimalBuy money)
as
begin
	insert into @table
	select P.[Name],S.[NumberSold],S.[DateSold],S.[ClientId],min(S.NumberSold * P.Price)
	from Clients as C
	join Sales as S on S.ClientId = C.Id
	join Products as P on S.ProductId = P.Id
	where C.Firstname = @firstname and C.Lastname = @lastname
	and C.Fathersname = @fathersname
	group by P.[Name],S.[NumberSold],S.[DateSold],S.[ClientId];
	return
end

--3
create function TotalIncomeByDate(
	@date date)
returns money
as
	begin
		return (
			select sum(S.NumberSold * P.Price)
			from Sales as S join Products as P on S.ProductId = P.Id
			where S.DateSold = @date
			   )
	end

--4
create function DateOfMaxIncome()
returns date
as
	begin
		return(
				select DB.DateSold as 'Date of maximum income'
				from (  select top 1 S.DateSold,sum(S.NumberSold * P.Price) as 'Total income'
						from Sales as S join Products as P on S.ProductId = P.Id
						group by S.DateSold
						order by 'Total income' desc) as DB
			)
	end

--5
create function GetSalesByName(
	@name nvarchar(200))
returns @table table(ProductName nvarchar(200),NumberSold int,DateSold date,EmployeeId int,ClientId int)
as
	begin
		insert into @table
		select P.[Name],S.NumberSold,S.DateSold,S.EmployeeId,S.ClientId
		from Products as P join Sales as S on S.ProductId = P.Id
		where P.[Name] = @name;
		return
	end

--6
create function SameSurnameEmployees()
returns @table table(
					Lastname nvarchar(100),Firstname nvarchar(100),Fathersname nvarchar(100),
					DateIn date,Gender varchar(20),Salary money
					)
as
	begin
		insert into @table
		select E.Lastname,E.Firstname,E.Fathersname,E.DateIn,E.Gender,E.Salary
		from Employees as E
		group by E.Lastname,E.Firstname,E.Fathersname,E.DateIn,E.Gender,E.Salary
		having count(E.Lastname) > 1;
		return
	end

--7
create function SameSurnameClients()
returns @table table(
					Lastname nvarchar(100),Firstname nvarchar(100),Fathersname nvarchar(100),
					Gender varchar(20),Email varchar(320),Phone varchar(20),IsSubscribed bit,SalePercent int
					)
as
	begin
		insert into @table
		select C.Lastname,C.Firstname,C.Fathersname,C.Gender,C.Email,C.Phone,C.IsSubscribed,C.SalePercent
		from Clients as C
		group by C.Lastname,C.Firstname,C.Fathersname,C.Gender,C.Email,C.Phone,C.IsSubscribed,C.SalePercent
		having count(C.Lastname) > 1;
		return
	end