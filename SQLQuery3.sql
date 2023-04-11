--SELECT FirstName, LastName, JobTitle, Salary
--FROM EmployeeDemographic
--join EmployeeSalary
--  on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

--SELECT FirstName, LastName, JobTitle, Salary,
--  CASE
--      When JobTitle = 'Salesman' THEN Salary + (Salary * .10)
--	  When JobTitle = 'Accountant' THEN Salary + (Salary * .05)
--	  When JobTitle = 'HR' THEN Salary + (Salary * .000001)
--	  Else Salary + (Salary * .03)
--	  End AS SalaryAfterIncrement
--FROM EmployeeDemographic
--join EmployeeSalary
--  on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

--select Jobtitle, Count(JobTitle)
--from EmployeeDemographic
--join EmployeeSalary
--on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
--group by JobTitle
--Having count(JobTitle) > 1

--select Jobtitle, AVG(Salary)
--from EmployeeDemographic
--join EmployeeSalary
--on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
--group by JobTitle
--Having AVG(Salary) > 45000
--order by AVG(Salary)

--select *
--from WarehouseEmployeeDemographic

--update Mohit.dbo.EmployeeDemographic
--SET EmployeeID = 1010
--where FirstName = 'Jim' And LastName = 'Halpert'

--update mohit.dbo.WarehouseEmployeeDemographic
--SET Age = 35, Gender = 'Female'
--Where FirstName = 'Darryl' AND LastName = 'Philbin'

--delete mohit.dbo.WarehouseEmployeeDemographic
--Where EmployeeID = 1052

--Select FirstName AS Fname
--from EmployeeDemographic

--Select FirstName + ' ' + LastName AS FullName
--from EmployeeDemographic

--Select AVG(Age) AS AvgAge
--from EmployeeDemographic

--select FirstName, LastName, Gender, Salary,
--Count(Gender) OVER (PARTITION by Gender) AS TotalGen 
--from EmployeeDemographic
--join EmployeeSalary
--on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

--select Gender, COUNT(Gender)
--from EmployeeDemographic
--join EmployeeSalary
--on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
--Group by Gender