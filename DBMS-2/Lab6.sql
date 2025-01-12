Create Table Products(
	Product_id int,
	Product_Name varchar(250) Not Null,
	Price Decimal(10,2)  Not Null,
	Primary Key(Product_id)
)

Insert into Products values (1,'Smartphone',35000)
Insert into Products values (2,'Laptop',65000)
Insert into Products values (3,'Headphones',5500)
Insert into Products values (4,'Television',85000)
Insert into Products values (5,'Gaming Console',32000)

Select * from Products
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
Declare
	@ProductId int,
	@ProductName varchar(50),
	@Price decimal(10,2)
Declare Product_Cursor CURSOR
FOR 
	Select Product_ID,
		   Product_Name,
		   Price
	From 
		   Products
Open Product_Cursor

Fetch Next From Product_Cursor Into
		@ProductId,
		@ProductName,
		@Price
While @@FETCH_STATUS=0
	Begin
		Print 'Product ID - '+CAST(@ProductId AS varchar(50))+' Product Name- '+@ProductName+' Price- '+
			  CAST(@Price AS varchar(50))
		Fetch Next From Product_Cursor Into
		@ProductId,
		@ProductName,
		@Price
	End
Close Product_Cursor
Deallocate Product_Cursor


--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.
--(Example: 1_Smartphone)
Declare
	@Product_Id int,
	@Product_Name varchar(50)
Declare Product_Cursor_Fetch CURSOR
FOR
	Select Product_ID,
		   Product_Name
	From
		   Products
Open Product_Cursor_Fetch
Fetch Next From Product_Cursor_Fetch into
	@Product_Id,
	@Product_Name
While @@FETCH_STATUS=0
	Begin
		Print CAST(@Product_ID AS varchar(50))+'_'+@Product_Name
		Fetch Next From Product_Cursor_Fetch into
					@Product_Id,
					@Product_Name
	End
Close Product_Cursor_Fetch
Deallocate Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
Declare
	@ProductId1 int,
	@Productname1 varchar(50),
	@Price1 decimal(10,2)
Declare Product_Cursor_Filter CURSOR
For
	Select Product_ID,
		   Product_Name,
		   Price
	From Products where price>30000
Open Product_Cursor_Filter
Fetch Next From Product_Cursor_Filter into
	@ProductId1,
	@Productname1,
	@Price1
While @@FETCH_STATUS=0
Begin
	Print CAST(@ProductId1 As Varchar(50))+' '+@Productname1+' '+CAST(@Price1 As Varchar(50))
	Fetch Next From Product_Cursor_Filter into
	@ProductId1,
	@Productname1,
	@Price1
End
Close Product_Cursor_Filter
Deallocate Product_Cursor_Filter

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
Declare
	@ProductID2 int,
	@ProductName2 varchar(50),
	@Price2 decimal(10,2)
Declare Product_CursorDelete CURSOR
For
	Select Product_ID from Products
Open Product_CursorDelete
Fetch Next From Product_CursorDelete into @ProductID2
While @@FETCH_STATUS=0
Begin
	Delete From Products 
	Print ('Products are deleted')
	Fetch Next From Product_CursorDelete into @ProductID2
End
Close Product_CursorDelete
Deallocate Product_CursorDelete
Select * from Products

--Part – B
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases
--the price by 10%.
Declare 
	@Product_id1 int,
	@Product_name1 varchar(50),
	@Price_1 decimal(10,2)
Declare Product_CursorUpdate CURSOR
For 
	Select Product_ID,
		   Product_Name,
		   Price
	From Products
Open Product_CursorUpdate
Fetch Next from Product_CursorUpdate into @Product_id1,@Product_name1,@Price_1
While @@FETCH_STATUS=0
Begin
	Update Products
	Set Price = Price+ (Price*0.1)
	where Product_id=@Product_id1
	Fetch Next from Product_CursorUpdate into @Product_id1,@Product_name1,@Price_1
End
Close Product_CursorUpdate
Deallocate Product_CursorUpdate
Select * from Products

--6. Create a Cursor to Rounds the price of each product to the nearest whole number.
Declare
	@Product_id2 int,
	@Price_2 Decimal(10,2)
Declare Product_RoundCursor CURSOR
For
	Select Product_id,
		   Price
	From 
		   Products
Open  Product_RoundCursor
Fetch Next From Product_RoundCursor into
	@Product_id2,
	@Price_2
While @@FETCH_STATUS=0
Begin
	Update Products
	Set Price = ROUND(Price,0)
	Where Product_id=@Product_id2
	Fetch Next From Product_RoundCursor into
	@Product_id2,
	@Price_2
End
Close Product_RoundCursor
Deallocate Product_RoundCursor
Select * from Products

--Part – C
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop”
--(Note: Create NewProducts table first with same fields as Products table)
Create Table NewProducts(
	Product_id int,
	Product_name varchar(50),
	Price decimal(10,2)
)
Declare
	@id int,
	@name varchar(50),
	@amt decimal(10,2)
Declare Product_CursorTable CURSOR
For
	Select * from Products
	Where Product_Name='Laptop'
Open Product_CursorTable
	Fetch  Next From Product_CursorTable into
		@id,
		@name,
		@amt
While @@FETCH_STATUS=0
Begin
	Insert into NewProducts values (@id,@name,@amt)
	Fetch  Next From Product_CursorTable into
		@id,
		@name,
		@amt
End
Close Product_CursorTable
Deallocate Product_CursorTable
Select * from NewProducts
Select * from Products
--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products
--with a price above 50000 to an archive table, removing them from the original Products table.
Create Table ArchivedProducts(
	Product_id int,
	Product_name varchar(50),
	Price decimal(10,2)
)
Declare
	@id1 int,
	@name1 varchar(50),
	@amt1 decimal(10,2)
Declare Product_CursorTable1 CURSOR 
For
	SELECT product_id, product_name, price
FROM Products
WHERE price > 50000

Open Product_CursorTable1
Fetch Next From Product_CursorTable1 into
	@id1,
	@name1,
	@amt1
While @@FETCH_STATUS=0
Begin
	Insert into ArchivedProducts  values (@id1,@name1,@amt1)
	Delete From Products Where Product_id=@id1 
	Fetch Next From Product_CursorTable1 into
	@id1,
	@name1,
	@amt1
End
Close  Product_CursorTable1
Deallocate Product_CursorTable1
Select * from ArchivedProducts
Select * from Products
