--Skapa ett ordningsnummer efter pris
SELECT
	Name
	,ListPrice
	,RANK() OVER(ORDER BY Listprice DESC) AS Prisrank
FROM
	Production.Product