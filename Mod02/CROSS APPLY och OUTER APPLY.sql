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


--Kan jag f� fram den dyraste produkten fr�n ALLA kategorier
--Anv�nd CROSS APPLY
SELECT
	pc.Name AS Kategori
	,pc.ProductCategoryID AS Kategoriid
	,e.*
FROM
	SalesLT.ProductCategory AS pc CROSS APPLY dbo.expensiveproducts(pc.ProductCategoryID) AS e
ORDER BY 2


--Jag f�r inte med alla kategorier. Bara dem som finns i tabellesn Saleslt.product
SELECT * FROM SalesLT.ProductCategory

--F�r att f� med alla fr�n tabellen, anv�nd OUTER APPLY
SELECT
	pc.Name AS Kategori
	,pc.ProductCategoryID AS Kategoriid
	,e.*
FROM
	SalesLT.ProductCategory AS pc OUTER APPLY dbo.expensiveproducts(pc.ProductCategoryID) AS e
ORDER BY 2