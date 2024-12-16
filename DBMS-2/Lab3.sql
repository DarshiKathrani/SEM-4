CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE,
 ManagerID INT NOT NULL,
 Location VARCHAR(100) NOT NULL
);
CREATE TABLE Employee (
 EmployeeID INT PRIMARY KEY,
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 DoB DATETIME NOT NULL,
 Gender VARCHAR(50) NOT NULL,
 HireDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 Salary DECIMAL(10, 2) NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Create Projects Table
CREATE TABLE Projects (
 ProjectID INT PRIMARY KEY,
 ProjectName VARCHAR(100) NOT NULL,
 StartDate DATETIME NOT NULL,
 EndDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location)
VALUES
 (1, 'IT', 101, 'New York'),
 (2, 'HR', 102, 'San Francisco'),
 (3, 'Finance', 103, 'Los Angeles'),
 (4, 'Admin', 104, 'Chicago'),
 (5, 'Marketing', 105, 'Miami');
 SELECT * from Departments
INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID,
Salary)
VALUES
 (101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00),
 (102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00),
 (103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00),
 (104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00),
 (105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00);
 Select * from Employee
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID)
VALUES
 (201, 'Project Alpha', '2022-01-01', '2022-12-31', 1),
 (202, 'Project Beta', '2023-03-15', '2024-03-14', 2),
 (203, 'Project Gamma', '2021-06-01', '2022-05-31', 3),
 (204, 'Project Delta', '2020-10-10', '2021-10-09', 4),
 (205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);
 Select * from Projects
--Part – A
--1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based
--on this you must give EmployeeID, DOB, Gender & Hiredate.
Create Or Alter Procedure PR_Employee_Details
@Fname varchar(50)=null,
@Lname varchar(50)=null
As 
Begin
Select EmployeeId,DOB,Gender,Hiredate
from Employee
where (FirstName=@Fname) or (LastName=@Lname)
End


PR_Employee_Details '','Doe'

--2. Create a Procedure that will accept Department Name and based on that gives employees list who
--belongs to that department. 
Create Or Alter Procedure PR_Employee_OnDeptName
@DeptName varchar(50)
As
Begin
Select E.FirstName,D.DepartmentName
from Employee as E
join Departments as  D
on D.DepartmentID=E.DepartmentID
where D.DepartmentName=@DeptName
End

PR_Employee_OnDeptName 'HR'

--3. Create a Procedure that accepts Project Name & Department Name and based on that you must give
--all the project related details.
Create Or Alter Procedure PR_Project_JoinDepartments
@Pname varchar(50),
@Dname varchar(50)
As
Begin
Select P.ProjectName,P.ProjectId,P.StartDate,P.EndDate,P.DepartmentID,D.DepartmentName
From Projects as P 
join Departments as D
On D.DepartmentID=P.DepartmentID
Where P.ProjectName=@Pname and D.DepartmentName=@Dname
End
PR_Project_JoinDepartments 'Project Alpha','IT'

--4. Create a procedure that will accepts any integer and if salary is between provided integer, then those
--employee list comes in output.
Create Or Alter Procedure PR_SALARY_VALID
@Salary1 decimal(10,2)
As
Begin
Select * from Employee 
Where Salary < @Salary1
End
PR_SALARY_VALID 82000

--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date. 
Create Or Alter Procedure PR_Employees_OnHireDate
@Date1 Datetime
As 
Begin
Select * from Employee
where HireDate=@Date1
End
 PR_Employees_OnHireDate '2012-07-18'

--Part – B
--6. Create a Procedure that accepts Gender’s first letter only and based on that employee details will be
--served.
Create Or Alter Procedure PR_Employee_OnGender
@Fgender varchar(50)
As
Begin
Select * from Employee
where Gender like @Fgender+'%'
End
PR_Employee_OnGender 'M'



--7. Create a Procedure that accepts First Name or Department Name as input and based on that employee
--data will come.
Create Or Alter Procedure PR_Employee_ONNameAndDept
@Fname varchar(50),
@DeptName varchar(50)
As
Begin
Select e.EmployeeID,e.FirstName,e.LastName,e.Gender,e.DoB,e.HireDate,e.Salary,d.DepartmentName
From Employee as e
Join Departments as d
on d.DepartmentID=e.DepartmentID
where e.FirstName=@Fname and d.DepartmentName=@DeptName
End
PR_Employee_ONNameAndDept 'Michael','Marketing'

--8. Create a procedure that will accepts location, if user enters a location any characters, then he/she will
--get all the departments with all data.
Create Or Alter Procedure PR_Department_Location
@loc varchar(50)
As
Begin
Select * from Departments
where Location like '%'+@loc+'%'
End
PR_Department_Location 'ag'

--Part – C0
--9. Create a procedure that will accepts From Date & To Date and based on that he/she will retrieve Project
--related data.
Create or Alter Procedure PR_Project_OnDates
@From Datetime,
@To Datetime
As
Begin
Select  * from Projects
Where StartDate=@From and EndDate=@To
End
PR_Project_OnDates '2021-06-01', '2022-05-31'

--10. Create a procedure in which user will enter project name & location and based on that you must
--provide all data with Department Name, Manager Name with Project Name & Starting Ending Dates.
Create Or Alter Procedure PR_Join_ProDept
@Pname varchar(50),
@Loc varchar(50)
As
Begin
Select (e.FirstName+e.LastName) as ManagerName,d.DepartmentName,p.projectName,p.StartDate,p.EndDate
from Employee as e
Join Departments as d
on e.EmployeeID=d.ManagerID 
Join Projects as P
on P.DepartmentID=D.DepartmentID
where p.ProjectName=@Pname and d.Location=@loc
End
PR_Join_ProDept 'Project Gamma','Los Angeles'