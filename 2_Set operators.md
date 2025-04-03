
## Exercise 1: Union, Except, Intersect

```bash
-- 1.1 Unika namn från båda tabellerna (utan dubbletter)

SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureworksDW.dbo.DimEmployee
UNION 
SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureWorks.Person.Person
```

```bash
-- 1.2 Samma som ovan, men tillåter dubbletter

SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureworksDW.dbo.DimEmployee
UNION ALL
SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureWorks.Person.Person
```

```bash
-- 1.3 Endast namn som finns i båda tabellerna

SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureworksDW.dbo.DimEmployee
INTERSECT
SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureWorks.Person.Person
```

```bash
-- 1.4 Namn som endast finns i DimEmployee men inte i Person.Person

SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureworksDW.dbo.DimEmployee
EXCEPT
SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureWorks.Person.Person
```

---

## Exercise 2: CROSS APPLY och OUTER APPLY

```bash
-- 2.1 Funktion som returnerar senaste ordern för en kund

USE AdventureWorksLT;
GO
CREATE FUNCTION dbo.fn_lastorder(@custid INT)
RETURNS TABLE AS 
RETURN
SELECT
	SalesOrderID,
	CustomerID,
	TotalDue
FROM
	SalesLT.SalesOrderHeader
WHERE 
	CustomerID = @custid;
GO

-- Testa funktionen
SELECT * FROM dbo.fn_lastorder(29847);
```

```bash
-- 2.2 Visa endast kunder som har en order (CROSS APPLY)

SELECT
	c.CustomerID,
	Companyname,
	LastName,
	FirstName,
	f.*
FROM
	SalesLT.Customer AS c
CROSS APPLY dbo.fn_lastorder(c.CustomerID) AS f;
```

```bash
-- 2.3 Visa alla kunder, även de utan order (OUTER APPLY)

SELECT
	c.CustomerID,
	Companyname,
	LastName,
	FirstName,
	f.*
FROM
	SalesLT.Customer AS c
OUTER APPLY dbo.fn_lastorder(c.CustomerID) AS f;
```


