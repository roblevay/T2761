Självklart Robert – här kommer **övningarna snyggt inramade med bash-taggar** i GitHub-stil, redo att klistras in i din `.md`-fil.

---

## Exercise 1: Union, Except, Intersect

```bash
-- 1.1 Unika namn från båda tabellerna (utan dubbletter)

SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureworksDW2019.dbo.DimEmployee
UNION 
SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureWorks2017.Person.Person
```

```bash
-- 1.2 Samma som ovan, men tillåter dubbletter

SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureworksDW2019.dbo.DimEmployee
UNION ALL
SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureWorks2017.Person.Person
```

```bash
-- 1.3 Endast namn som finns i båda tabellerna

SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureworksDW2019.dbo.DimEmployee
INTERSECT
SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureWorks2017.Person.Person
```

```bash
-- 1.4 Namn som endast finns i DimEmployee men inte i Person.Person

SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureworksDW2019.dbo.DimEmployee
EXCEPT
SELECT
	Firstname,
	Middlename,
	Lastname
FROM 
	AdventureWorks2017.Person.Person
```

---

## Exercise 2: CROSS APPLY och OUTER APPLY

```bash
-- 2.1 Funktion som returnerar senaste ordern för en kund

USE AdventureWorksLT;

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

---

Vill du att jag tar nästa modul också? Jag kör gärna hela vägen!
