--select Distinct(Gender)
--from EmployeeDemographic

--Select Gender
--from EmployeeDemographic
--group by Gender

--select * from EmployeeDemographic
--Select Gender, count(Gender)
--From EmployeeDemographic
--group by Gender


----Select Gender,Age, count(Gender)
----From EmployeeDemographic
----group by Gender, Age

--select Gender, Count(Gender) as countgender
--from EmployeeDemographic
--where Age > 31
--group by Gender
--order by countgender ASC

--select Salary
--from EmployeeSalary
--order by Salary Desc

--select * 
--from Mohit.dbo.EmployeeDemographic
--Full outer join Mohit.dbo.EmployeeSalary
-- on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
-- where FirstName <> 'Michael'
-- order by Salary DESC

--select JobTitle,Salary
--from Mohit.dbo.EmployeeDemographic
--Full outer join Mohit.dbo.EmployeeSalary
-- on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
-- where JobTitle = 'Salesman'

--select JobTitle,AVG(Salary)
--from Mohit.dbo.EmployeeDemographic
--Full outer join Mohit.dbo.EmployeeSalary
-- on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
-- where JobTitle = 'Salesman'
-- group by JobTitle

--select * 
--from EmployeeDemographic
--union
--select *
--from WarehouseEmployeeDemographic
--order by EmployeeID

--select EmployeeID, JobTitle, Salary 
--from EmployeeSalary
--union 
--select EmployeeID, FirstName, Age
--from EmployeeDemographic
--order by EmployeeID

/*
Case Statement
*/

--select FirstName, LastName, Age,
--case
--  when Age > 32 Then 'Old'
--  when Age between 30 and 32 Then 'Young'
--  else 'Baby'
--  End
--from EmployeeDemographic
--where Age is NOT NULL
--order by Age
