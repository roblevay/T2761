--Anv�nd en parameter
--ta fram de tre dyraste produkterna f�r en viss kategori
DECLARE @categoryid INT =4
SELECT 
	*
FROM
	(SELECT TOP 3
		name, productsubcategoryid,ListPrice
	FROM
		Production.Product
	WHERE
		@categoryid=ProductSubcategoryID
	ORDER BY
		ListPrice DESC) AS t
ORDER BY Name