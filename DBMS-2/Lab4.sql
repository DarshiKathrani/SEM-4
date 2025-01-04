--Part – A
--1. Write a function to print "hello world".
Create or Alter Function FN_HelloWorld()
Returns varchar(50)
As
Begin
	Return 'Hello World'
End

Select dbo.FN_HelloWorld()

--2. Write a function which returns addition of two numbers.
Create or Alter Function Fn_AddTwoNo(
	@n1 int,
	@n2 int
)
Returns int
As
Begin
	Return @n1+@n2
End

Select dbo.Fn_AddTwoNo(3,6)


--3. Write a function to check whether the given number is ODD or EVEN.
Create Or Alter  Function Fn_CheckOddEven(@n int)
Returns varchar(50)
As
Begin
	IF @n%2=0
		Return 'Even'
Return 'Odd'
End

Select dbo.Fn_CheckOddEven(6)

--4. Write a function which returns a table with details of a person whose first name starts with B.
Create or Alter Function Fn_PersonStartsB()
Returns Table
As
Return (Select * from person where FirstName like 'B%')

Select * from dbo.Fn_PersonStartsB()

--5. Write a function which returns a table with unique first names from the person table.
Create or Alter Function Fn_UniqueName()
Returns Table
As
	Return(Select distinct firstName from person)
Select * from dbo.Fn_UniqueName()


--6. Write a function to print number from 1 to N. (Using while loop)
Create Or Alter Function Fn_PrintOneToN(@n int)
Returns varchar(50)
As
Begin
	Declare @i int, @ans varchar(50)
	Set @i=1
	Set @ans=''
	while(@i<=@n)
	Begin
		set @ans = @ans + Cast(@i as varchar)+' '
		set	@i = @i+1
	End
Return @ans
End

Select dbo.Fn_PrintOneToN(10)

--7. Write a function to find the factorial of a given integer.
Create Or Alter Function Fn_Factorial(@n int)
Returns int
As
Begin
	Declare @ans int , @i int
	set @ans=1
	set @i=1
	while(@i<=@n)
		Begin
			If(@n=0 or @n=1)
				set @ans=1
			Else
				set @ans=@ans*@i
			set @i=@i+1
		End
	Return @ans
End

Select dbo.Fn_Factorial(5)

--Part – B
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
Create Or Alter Function Fn_CompareTwoNo(
	@n1 int,
	@n2 int
)
Returns varchar(50)
As
Begin
	Return Case
		When @n1 < @n2 Then Cast(@n2 As Varchar(50))+' is  greater'
		When @n1 > @n2 Then Cast(@n1 As Varchar(50))+' is greater'
		Else 'Both are equal'
		End
End

Select dbo.Fn_CompareTwoNo(10,10)

--9. Write a function to print the sum of even numbers between 1 to 20.
Create Or Alter Function Fn_SumOfEven()
Returns int
As
Begin
	Declare @sum int,@i int
	set @sum=0
	set @i=1
	while(@i<=20)
		Begin
		If(@i%2=0)
			set @sum=@sum+@i
			set @i=@i+1
		End
Return @sum
End

Select dbo.Fn_SumOfEven()

--10. Write a function that checks if a given string is a palindrome
Create Or Alter Function Fn_CheckPalindrome(@n int)
Returns varchar(50)
As
Begin
	Declare @ans varchar(50),
			@re int,
			@b int,
			@temp varchar(50)
	Set @temp=@n
	Set @b=0
	While(@n>0)
		Begin
			Set @re = @n % 10
			Set @b = @b*10+@re
			Set @n=@n/10																																																																																																																																																																																																																																																																																																																																																																																																																																																													
		End
		If(@b=@temp)
			Set @ans='true'
		Else
			Set @ans='false'
Return @ans
End

Select dbo.Fn_CheckPalindrome(121)

--Part – C
--11. Write a function to check whether a given number is prime or not.
Create Or Alter Function Fn_CheckPrime(@n int)
Returns varchar(50)
As
Begin
	Declare @i int,@counter int
	Set @i=2
	Set @counter=0
	while(@i<=@n/2)
		Begin
			If(@n%@i=0)
				Set @counter=@counter+1
		Set @i=@i+1
		End
		If(@counter=0)
			Return 'true'
	
Return 'False'
End

Select dbo.Fn_checkPrime(7)

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.
Create Or Alter Function Fn_DateDiff(
	@SDate Date,
	@EDate Date
)
Returns int
As
Begin
RETURN(DATEDIFF(DAY,@SDate,@EDate))
End

Select dbo.Fn_DateDiff('2011/08/27', '2011/08/29')
--13. Write a function which accepts two parameters year & month in integer and returns total days each
--year.
CREATE OR ALTER FUNCTION FN_COUNTDAYS(@MONTH INT,@YEAR INT)
RETURNS INT
AS
BEGIN
	DECLARE @DATE VARCHAR(50)
	SET @DATE=CONCAT(@YEAR,'-',@MONTH,'-','1')
	DECLARE @DAY DATETIME=CAST(@DATE AS DATE)
	RETURN DAY(EOMONTH(@DAY))
END 
Select dbo.Fn_COUNTDAYS(2,2024)

--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.
Create Or Alter Function Fn_PersonDetail(
	@DeptId int
)
Returns table
As
	Return(Select * from person where DepartmentID=@DeptId)
Select * from dbo.Fn_PersonDetail(2)

--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.
Create Or Alter Function Fn_PersonDetail2(
	@JoinDate date
)
Returns table
As
	Return(Select * from person where JoiningDate>@JoinDate)
Select * from dbo.Fn_PersonDetail2('1991-1-1')