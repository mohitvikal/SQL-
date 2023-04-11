/*
CTE - Common Table Expression)
*/

--WITH CTE_Employee AS (Select FirstName, LastName, Gender, Salary,
--  COUNT(Gender) over (Partition by Gender) AS TotalGender,
--  AVG(Salary) Over (Partition by Gender) AS AvgSalary
--  From EmployeeDemographic Join EmployeeSalary
--  on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
--  where Salary > '45000'
--  ) 
--  select *
--  from CTE_Employee

/*
Temp Tables
*/

--Create table #Temp_Employee (
--EmployeeID int,
--JobTitle varchar(100),
--Salary int
--)

--Insert into #Temp_Employee values (
--'1001', 'HR', '45000'
--)

--Insert into #Temp_Employee 
--select *
--From EmployeeSalary

Select *
From #Temp_Employee
order by EmployeeID

