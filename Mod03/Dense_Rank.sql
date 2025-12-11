--Skapa ett ordningsnummer efter pris
--Inga "hål"
SELECT
	Name
	,ListPrice
	,DENSE_RANK() OVER(ORDER BY Listprice DESC) AS DenseRank
FROM
	Production.Product