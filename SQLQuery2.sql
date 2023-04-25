
------------------------------------------------------------BASICS--------------------------------------------------------------

--*Create a Database*--
--CREATE DATABASE Employdatabase


--*Create a new table*

--CREATE TABLE EmployeeDemographics
--( EmployeeID int,
--firstname varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)


--CREATE TABLE EmployeeSalary
--(EmployeeID int,
--JobTitle varchar(50),
--Salary int)


--*Insert values into the created tables*

--INSERT INTO EmployeeDemographics VALUES
--(1001, 'bin', 'dust', 30, 'male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--Insert Into EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)


--*Delete all records of a table*
                                                                                                          
--DELETE FROM EmployeeDemographics

--SELECT TOP 5 * FROM EmployeeSalary


--SELECT * FROM EmployeeDemographics      //SELECT all from Table

--SELECT TOP 5 * FROM EmployeeSalary      //SELECT TOP 5 FROM TABLE

--SELECT DISTINCT(JobTitle)FROM EmployeeSalary    //SELECT Unique values of Hob title from table

--SELECT COUNT(EmployeeID) AS EMPLOYEENUMBER FROM EmployeeDemographics     //Count number of EMPID and name it EMPNUM from Table


--SELECT Salary FROM EmployeeSalary          // SELECT ROW Salary FROM Table

--SELECT MIN(Salary) FROM EmployeeSalary     //SHOW Minimum value of salary from table

--SELECT MAX(Salary) FROM EmployeeSalary     // SHOE Maximum value of salary from table

--SELECT AVG(Salary) AS Average FROM EmployeeSalary  //SHOW the average value of salary and name it as Average from Table

--SELECT firstname , LastName FROM EmployeeDemographics  // Select two values first and last name from table

--SELECT Gender,Age,firstname, COUNT(Gender) FROM EmployeeDemographics WHERE Age >= 30 And Gender ='male' And firstname Like 's%'
--GROUP BY Gender , Age, firstname ORDER BY Age ASC,Gender DESC    //used where[>= , And, Like] , group by , order by 

--SELECT * FROM EmployeeDemographics WHERE firstname IN ('Stanley','bin') //Used In to see all rows  which are in (value1 , value2)


----------------------------------------------------END OF BASICS--------------------------------------------------


------------------------------------------------------Intermediate---------------------------------------------------

--*INNER JOIN , FULL/LEFT/RIGHT  OUTER JOIN*--

--SELECT EmployeeDemographics.EmployeeID, firstname, JobTitle, Salary FROM Employdatabase.dbo.EmployeeDemographics
--LEFT OUTER JOIN Employdatabase.dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE Salary <> 45000 AND firstname LIKE '%a%'
--GROUP BY EmployeeDemographics.EmployeeID, firstname, JobTitle, Salary

--*UNION , UNION ALL*--




--*Create a third table---

--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)

--*insert values into third table

--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

--SELECT * FROM Employdatabase.dbo.WareHouseEmployeeDemographics



                                                                      --*Case statement*--

--*To determine the qualification of a emplyee as OLD (age>32) Young (age 30-32) Baby (<30)--

--SELECT firstname , LastName , Age,
--CASE
--   WHEN  Age > 32 THEN 'OLD'
--   WHEN Age BETWEEN 30 AND 32 THEN 'YOUNG'
--   ELSE 'BABY'
--END AS Qualification
--FROM Employdatabase.dbo.EmployeeDemographics
--WHERE Age IS NOT NULL
--ORDER BY AGE


--* To provide a salary increments to empleyee and i prefer salesman get 10% , accountant get 05% and rest get 03% raise in salary*--
--SELECT firstname+''+lastname As Fullname, JobTitle, Salary, 
--CASE 
--    WHEN JobTitle = 'Salesman' THEN Salary + (Salary*.10)
--	WHEN Jobtitle = 'Accountant' THEN Salary + (Salary*.05)
--	ELSE Salary + (Salary*.03)
--END AS INCREMENT
--FROM Employdatabase.dbo.EmployeeDemographics Demo
--JOIN Employdatabase.dbo.EmployeeSalary Sal
--ON Demo.EmployeeID = Sal.EmployeeID



                                                            --*Having Clause*--

--*I wanna determine number of positions (jobtitles) having more than one person working on it *--

--SELECT  JobTitle, COUNT(JobTitle) AS Noofpeeps
--FROM Employdatabase.dbo.EmployeeDemographics Demo
--JOIN Employdatabase.dbo.EmployeeSalary Sal
--ON Demo.EmployeeID=Sal.EmployeeID
--GROUP BY JobTitle
--HAVING COUNT(JobTitle)>1

                                                          --UPDATE/DELETE Data--

--*Updating Data last name and age employee ID 1010

--UPDATE  Employdatabase.dbo.EmployeeDemographics
--SET LastName='Osama' , Age='32'
--WHERE EmployeeID = 1010


--*Deleting a row having employee ID 1004

--DELETE FROM Employdatabase.dbo.EmployeeDemographics
--WHERE EmployeeID=1004


                                                                 --*PARTITION BY*--

--*please say number of same gender working and with thier names and age

--SELECT firstname+''+LastName As Fullname , Age,Gender, Count(Gender) OVER (PARTITION BY Gender) AS TotalGender 
--FROM Employdatabase.dbo.EmployeeDemographics Demo 
--JOIN Employdatabase.dbo.EmployeeSalary Sal
--ON Demo.EmployeeID=Sal.EmployeeID


---------------------------------------------------------End of Intermediate------------------------------------------------


-----------------------------------------------------------Advanced---------------------------------------------------------

                                                      ------*CTEs*------
													--Common Table Expression--
							--IT is a one time result set only to exists for the duration of the Query--

----*it is same as function call---


--With CTE_trial1 AS --//you created a fuction with name CTE_trial
--( SELECT firstname , LastName, Salary, COUNT(Gender) OVER (Partition By Gender) AS Gcount, AVG(Salary)Over (Partition by Gender) As avgsalary
--FROM Employdatabase.dbo.EmployeeDemographics Demo
--JOIN Employdatabase.dbo.EmployeeSalary Sal
--ON Demo.EmployeeID=Sal.EmployeeID
----Where Salary  45000
--)

--SELECT *    --//SELECT EVERYTHING FROM THE ABOVE FUCTION CTE_trial1
--FROM CTE_trial1



                                                           --*TEMP TABLE--
														  --Temporary Table--
--Tempary table is similar as permanent table but the table gets deleted once the connection is removed and temp table is stored in TempDB--

--*IT is exactly same as normal table but with '#' infront--
--USE1: it can be used to perform a temparary operation which shouldn't affect the actual table--


--DROP TABLE IF EXISTS #temp_table1   --//DELETE THE TEMP TABLE IF ALREADY EXISTS
--CREATE TABLE #temp_table1(    --//CREATE A Temp table by adding '#' before table name 
--EmployeeID int,
--firstname varchar(50),
--LastName varchar(50),
--Age int,
--Gender Varchar(50)
--)

--SELECT * FROM #temp_table1

--INSERT INTO #temp_table1              --//Inserting value to temp table from emplyeedemographics table
--SELECT * FROM Employdatabase.dbo.EmployeeDemographics

--CREATE TABLE #temp_table2(     --//Creating 2nd temp table         
--firstname Varchar(50), LastName Varchar(50), Salary int, Gender varchar(50))

--ALTER TABLE #temp_table2 ADD Age int

--SELECT * FROM #temp_table2

--INSERT INTO #temp_table2   --//USE2: Already perfored opration ooutput can be created into a table by inserting its value into temp table
--SELECT firstname , LastName, Salary, COUNT(Gender) OVER (Partition By Gender) AS Gcount, AVG(Salary)Over (Partition by Gender) As avgsalary
--FROM Employdatabase.dbo.EmployeeDemographics Demo
--JOIN Employdatabase.dbo.EmployeeSalary Sal
--ON Demo.EmployeeID=Sal.EmployeeID

                       -------STRING FUNCTIONs : TRIM, LTRIM, RTRIM, REPLACE, Substring, Upper , Lower-----

--DROP TABLE IF EXISTS #Temp_tablestring
-- CREATE TABLE #Temp_tablestring
-- ( EmplyeeID VARCHAR(50),FirstName Varchar(50), LastName varchar(50))

-- Insert into #Temp_tablestring Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

-- -----TRIM, LTRIM, RTRIM
-- SELECT EmplyeeID, TRIM(EmplyeeID) AS Trimmstring    --//Trim the space
-- FROM #Temp_tablestring

-- SELECT EmplyeeID, LTRIM(EmplyeeID) AS Trimmstring  --//Trim the space from left
-- FROM #Temp_tablestring

-- SELECT EmplyeeID, RTRIM(EmplyeeID) AS Trimmstring     --//Trim the space from Right
-- FROM #Temp_tablestring

-- ----REPLACE--------
-- SELECT LastName , REPLACE(LastName,'- Fired' ,' ') as replaced   --//find the letter from lastname nad replace with empty
-- FROM #Temp_tablestring

-- ------SUBSTRING----
-- SELECT  FirstName , SUBSTRING(FirstName,1,3) AS Substr  --//SELECT LETTERS starting from first letter and 3 digits from there From Firstname 
-- FROM #Temp_tablestring

-- SELECT  LastName , SUBSTRING(LastName,4,6) AS Substr     --//Select letters from 4th letter and 6 digits from lastname 
-- FROM #Temp_tablestring


-----UPPER , LOWER----
--SELECT FirstName , UPPER(FirstName) AS Upperletters, LastName , LOWER(LastName) AS LowerLetter --//upper and lower letters
--FROM #Temp_tablestring

                                                          ---Stored Procedures---
--										--It is exactly same as creating library or inbuild function --
----Storing a simple table 

--CREATE PROCEDURE Test AS
--Select * FROM Employdatabase.dbo.EmployeeDemographics

--Exec Test

----*Create a temp table and store it and it should contain jobtitles, number of employee in that job title , AVg age and avg salary 
----*Take the input from USER for which job title the select shoup show
---------------------------------------Stired in Programmable\stored procedure path
--CREATE PROCEDURE Temp_procedure 
--@JobTitle nvarchar(50)  --//Take the input from USER 
--AS 
--CREATE TABLE #temp_table(
--Jobtitle Varchar(50),
--Employeeperjob INT,
--Age INT,
--Salary INT)

--INSERT INTO #temp_table
--SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
--FROM Employdatabase.dbo.EmployeeDemographics Demo
--JOIN Employdatabase.dbo.EmployeeSalary Sal
--ON Demo.EmployeeID=Sal.EmployeeID
--WHERE JobTitle = @JobTitle       --//Return the value of onlu which user has selected
--GROUP BY JobTitle

--SELECT * FROM #temp_table

-------------------------------------------


--Exec Temp_procedure @JobTitle='Salesman'  --//Execute this annywhere to get the output, specify input if requested


                                         --*SUBQUERIES ( In the Select , From , Where Statements)---
										            -- Queries within the queries--
									
----SUBQUERY By select

--SELECT EmployeeID, Age , Gender, (SELECT firstname+' '+LastName FROM Employdatabase.dbo.EmployeeDemographics )AS fullname
--FROM Employdatabase.dbo.EmployeeDemographics    --//Error This type of query cant be used]

--SELECT EmployeeID, Age , Gender, (SELECT AVG(Age) FROM Employdatabase.dbo.EmployeeDemographics ) AS fullname
--FROM Employdatabase.dbo.EmployeeDemographics     --//This gives 

----using Partition By

--SELECT EmployeeID, Age , Gender, AVG(Age) OVER () AS fullname
--FROM Employdatabase.dbo.EmployeeDemographics     --//This gives 


----Group by does not work here

-----Using from


--SELECT * FROM
--(SELECT EmployeeID, Age , Gender, AVG(Age) OVER () AS fullname
--FROM Employdatabase.dbo.EmployeeDemographics) a


----Using Where

--SELECT EmployeeID, Age , Gender
--FROM Employdatabase.dbo.EmployeeDemographics  
--WHERE EmployeeID in(
--                   SELECT EmployeeID FROM EmployeeSalary
--                    WHERE JobTitle like '%s%')