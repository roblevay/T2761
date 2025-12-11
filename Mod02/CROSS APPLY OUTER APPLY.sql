--Skapa en tabellfunktion
--som tar fram den senaste ordern för en kund

CREATE OR ALTER FUNCTION dbo.fn_senasteordern(@custid INT)
RETURNS TABLE 
AS
RETURN
SELECT TOP 1
	SalesOrderID,CustomerID,Freight
FROM 
	Sales.SalesOrderHeader
WHERE
	CustomerID=@custid
ORDER BY SalesOrderID
GO

--Testa 
SELECT * FROM dbo.fn_senasteordern(29825)

--Ta fram senaste ordern för VARJE kund
--Koppla ihop tabellen Customer med funktionen
--så att funktionen körs för varje rad
SELECT
	c.CustomerID,AccountNumber,s.SalesOrderID,s.Freight
FROM
	Sales.Customer AS c CROSS APPLY 
	dbo.fn_senasteordern(c.CustomerID) AS s

--Ta med alla kunder, även sådana som saknar ordrar
--Dvs alla från (vänstra) tabellen
SELECT
	c.CustomerID,AccountNumber,s.SalesOrderID,s.Freight
FROM
	Sales.Customer AS c OUTER APPLY 
	dbo.fn_senasteordern(c.CustomerID) AS s

