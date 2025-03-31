
## Exercise 1: Derived Table -Newest customers

--1.1 
USE AdventureWorksLT

SELECT TOP 10
    FirstName,
    LastName,
    ModifiedDate
FROM
    SalesLT.Customer
ORDER BY
    ModifiedDate DESC;

--1.2 
SELECT
	*
FROM
	(SELECT	TOP 10
	FirstName 
	,LastName	
	,ModifiedDate	
FROM
	SalesLT.Customer	
ORDER BY 
	ModifiedDate desc) AS t

--1.3	

SELECT
	*
FROM
	(SELECT	TOP 10
	FirstName AS Förnamn
	,LastName AS Efternamn
	,ModifiedDate	AS Ändringsdatum
FROM
	SalesLT.Customer	
ORDER BY 
	ModifiedDate desc) AS t

 
--1.4	

SELECT
	*
FROM
	(SELECT	TOP 10
	FirstName AS Förnamn
	,LastName AS Efternamn
	,ModifiedDate	AS Ändringsdatum
FROM
	SalesLT.Customer	
ORDER BY 
	ModifiedDate desc) AS t(Förnamn,Efternamn, Ändringsdatum)

## Exercise 2: CTE – Average Price by Color

2.1 

WITH CTE_year AS
	(
	SELECT 
		YEAR(Modifieddate) AS orderyear
		,CustomerID
	FROM Sales.SalesOrderHeader
	)

2.2

WITH CTE_year AS
	(
	SELECT 
		YEAR(Modifieddate) AS orderyear
		,CustomerID
	FROM Sales.SalesOrderHeader
	)
SELECT 
	orderyear
	,COUNT(DISTINCT CustomerID) AS cust_count
FROM CTE_year
GROUP BY
	orderyear

 
## Exercise 3: View – Reusable Product Averages

--3.1

USE Adventureworks
GO
CREATE OR ALTER VIEW dbo.salesterritory AS
SELECT
	name AS Territorium
	,YEAR(Orderdate) AS År
	,CAST(SUM(Totaldue)AS INT) AS Ordersumma
FROM
	Sales.SalesTerritory AS t INNER JOIN Sales.SalesOrderHeader	AS s
	ON t.TerritoryID=s.TerritoryID
GROUP BY
	name
	,YEAR(Orderdate)
GO

SELECT * FROM dbo.salesterritory

## Exercise 4: Inline Table-Valued Function – Customers with Long First Names

--4.1 
USE AdventureWorksLT
CREATE FUNCTION dbo.fn_CustomersWithLongNames(@length INT)
RETURNS TABLE
AS
RETURN
    SELECT CustomerID, FirstName, LastName
    FROM SalesLT.Customer
    WHERE LEN(FirstName) > @length;
GO

-- Usage:
SELECT * FROM dbo.fn_CustomersWithLongNames(10);
 

