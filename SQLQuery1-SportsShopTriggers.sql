use [SportsShop]
go

IF OBJECT_ID ('SportsShop.NewSaleDone','TR') IS NOT NULL
   DROP TRIGGER SportsShop.NewSaleDone;
GO


--1
create trigger NewSaleDone
on Sales
for insert
as
	if @@ROWCOUNT = 1
		begin
			insert into [History](ProductId,NumberSold,DateSold,EmployeeId,ClientId)
			select ProductId,NumberSold,DateSold,EmployeeId,ClientId from inserted;
		end
	else
		begin
			raiserror('error insert',0,1)
			rollback tran
		end


--2
create trigger OutOfStockProduct
on Products
for update
as
	if @@ROWCOUNT = 1
		begin
			declare @id int
			select @id = Id from inserted where Stock = 0
			if @id = null
				begin
					print('Still in stock')
					rollback tran
				end
			insert into [Archive]([Name],CategoryId,PrimeCost,ManufacturerId,Price)
			select [Name],CategoryId,PrimeCost,ManufacturerId,Price from inserted;
			delete from Products where Id = @id
		end
	else
		begin
			raiserror('error moving to archive',0,1)
			rollback tran
		end

--3
create trigger OnlyDistinctCLients
on Clients
for insert,update
as
	if @@ROWCOUNT = 1
		begin
			declare @firstname nvarchar(100)
			declare @lastname nvarchar(100)
			declare @fathersname nvarchar(100)
			declare @email nvarchar(320)
			select
				@firstname = Firstname,
				@lastname = Lastname,
				@fathersname = Fathersname,
				@email = Email 
				from Clients
			if exists
			(select *
			from Clients
			where Firstname = @firstname and Lastname = @lastname and Fathersname = @fathersname and Email = @email
			)
				begin
						raiserror('such client already exists',0,1)
						rollback tran
				end
			else
				begin
					print('Clients successfully updated')
				end
		end
	else
		begin
			raiserror('error inserting ot updating clients info',0,1)
			rollback tran
		end

--4
create trigger CannotDeleteClients
on Clients
for delete
as
	raiserror('Cannot delete clients',0,1)
	rollback tran

--5
create trigger CannotDeleteEmployees2015
on Employees
for delete
as
	if @@ROWCOUNT = 1
		begin
			declare @DateIn date
			select @DateIn = DateIn from deleted
			if @DateIn < '2015-01-01'
				begin
					raiserror('Cannot delete employees that were employed before 2015',0,1)
					rollback tran
				end
		end
	else
		begin
			raiserror('error deleting',0,1)
			rollback tran
		end

--6
create trigger DiscountGiving
on Sales
for insert
as
	if @@ROWCOUNT = 1
		begin
			declare @clientid int
			select @clientid = ClientId from inserted
			if exists(
			select Sum(S.NumberSold*P.Price)
			from Sales as S,Products as P
			where S.ProductId = P.Id and ClientId = @clientid
			having Sum(S.NumberSold*P.Price) > 50000)
				begin
					update Clients set SalePercent = 15 where Id = @clientid
				end
			else
				begin
					print('Has not spent enough yet')
				end
		end
	else
		begin
			raiserror('error giving discount to recent client',0,1)
			rollback tran
		end