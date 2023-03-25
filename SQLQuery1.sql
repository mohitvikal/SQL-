--create table EmployeeDemographic(
--EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--create table EmployeeSalary(
--EmployeeID int,
--JobTitle varchar(50),
--Salary int)

--insert into EmployeeDemographic values 
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32,'Male'),
--(1006, 'Micheal', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Malone', 31, 'Male')

--insert into EmployeeSalary values
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

 --select *
 --from EmployeeDemographic
 
 --select FirstName, LastName
 --from EmployeeDemographic

 --select TOP 5 *
 --from EmployeeDemographic

 --select distinct(EmployeeID)
 --from EmployeeDemographic

 -- select Count(LastName) AS LastNameCount
 --from EmployeeDemographic

 --select MAX(Salary) 
 --from EmployeeSalary

 --select MIN(Salary) 
 --from EmployeeSalary

 --select AVG(Salary) 
 --from EmployeeSalary

 --select * 
 --from EmployeeDemographic
 --Where FirstName = 'jim'

 -- select * 
 --from EmployeeDemographic
 --Where FirstName <> 'jim'

 -- select * 
 --from EmployeeDemographic
 --Where Age > 30

 --  select * 
 --from EmployeeDemographic
 --Where Age <= 32 AND Gender = 'Male'

 --select * 
 --from EmployeeDemographic
 --Where Age <= 32 OR Gender = 'Male'

 --select * 
 --from EmployeeDemographic
 --Where LastName LIKE 'S%'

 --select * 
 --from EmployeeDemographic
 --Where LastName LIKE '%S%'

 --select * 
 --from EmployeeDemographic
 --Where LastName LIKE 'S%o%'

 --select * 
 --from EmployeeDemographic
 --Where FirstName IN ('Jim', 'Micheal') 