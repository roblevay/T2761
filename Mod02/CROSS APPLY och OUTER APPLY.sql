--Skapa en funktion som tar fram den dyraste produkten av
--i en viss kategori
USE AdventureworksLT
GO

CREATE FUNCTION dbo.expensiveproducts(@catid INT)
RETURNS TABLE
AS
RETURN
	SELECT TOP 1
		ProductCategoryID
		,ProductID
		,ListPrice
		,Name
	FROM
		SalesLT.Product
	WHERE
		ProductCategoryID=@catid ORDER BY ListPrice DESC
GO

--Testa med kategori 5
SELECT * FROM dbo.expensiveproducts(8)


--Kan jag få fram den dyraste produkten från ALLA kategorier
--Använd CROSS APPLY
SELECT
	pc.Name AS Kategori
	,pc.ProductCategoryID AS Kategoriid
	,e.*
FROM
	SalesLT.ProductCategory AS pc CROSS APPLY dbo.expensiveproducts(pc.ProductCategoryID) AS e
ORDER BY 2


--Jag får inte med alla kategorier. Bara dem som finns i tabellesn Saleslt.product
SELECT * FROM SalesLT.ProductCategory

--För att få med alla från tabellen, använd OUTER APPLY
SELECT
	pc.Name AS Kategori
	,pc.ProductCategoryID AS Kategoriid
	,e.*
FROM
	SalesLT.ProductCategory AS pc OUTER APPLY dbo.expensiveproducts(pc.ProductCategoryID) AS e
ORDER BY 2