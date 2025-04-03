
## Exercise 1: Derived Table - Newest customers

```bash
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
```

```bash
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
```

```bash
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
```

```bash
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
```

---

## Exercise 2: CTE – Average Price by Color

```bash
--2.1

USE Adventureworks

WITH CTE_year AS
(
	SELECT 
		YEAR(ModifiedDate) AS orderyear,
		CustomerID
	FROM Sales.SalesOrderHeader
)
```

```bash
--2.2

USE Adventureworks

WITH CTE_year AS
(
	SELECT 
		YEAR(ModifiedDate) AS orderyear,
		CustomerID
	FROM Sales.SalesOrderHeader
)
SELECT 
	orderyear,
	COUNT(DISTINCT CustomerID) AS cust_count
FROM CTE_year
GROUP BY
	orderyear
```

---

## Exercise 3: View – Reusable Product Averages

```bash
--3.1
USE AdventureWorks
GO

CREATE OR ALTER VIEW dbo.salesterritory AS
SELECT
	name AS Territorium,
	YEAR(OrderDate) AS År,
	CAST(SUM(TotalDue)AS INT) AS Ordersumma
FROM
	Sales.SalesTerritory AS t
	INNER JOIN Sales.SalesOrderHeader AS s
	ON t.TerritoryID = s.TerritoryID
GROUP BY
	name,
	YEAR(OrderDate)
GO

SELECT * FROM dbo.salesterritory
```

---

## Exercise 4: Inline Table-Valued Function – Customers with Long First Names

```bash
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
```

```bash
-- Usage:
SELECT * FROM dbo.fn_CustomersWithLongNames(10);
```

