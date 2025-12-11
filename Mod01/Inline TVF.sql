--Ta fram den dyraste produkten i en kategori

CREATE OR ALTER FUNCTION dbo.dyrasteprodikategori(@catid INT)
RETURNS TABLE
AS
RETURN
SELECT TOP 3
	name,ProductSubcategoryID,ListPrice
FROM
	Production.Product WHERE
	ProductSubcategoryID=@catid
ORDER BY ListPrice DESC
GO

--Använd:
SELECT * FROM dbo.dyrasteprodikategori(15)