SELECT
	TerritoryID
	,YEAR(Orderdate) AS �r
	,SUM(Freight) AS Frakt
FROM
	Sales.SalesOrderHeader
GROUP BY ROLLUP --Aggregering f�r f�rsta kolumnen(territoryid)
(				--och totalt
	TerritoryID
	,YEAR(Orderdate)--Totalt
	)  ORDER BY �r

SELECT
	TerritoryID
	,YEAR(Orderdate) AS �r
	,SUM(Freight) AS Frakt
FROM
	Sales.SalesOrderHeader
GROUP BY CUBE --Alla uppt�nkliga aggregeringar
(				
	TerritoryID
	,YEAR(Orderdate)
	)  ORDER BY �r,TerritoryID