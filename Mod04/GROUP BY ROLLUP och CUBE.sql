SELECT
	TerritoryID
	,YEAR(Orderdate) AS År
	,SUM(Freight) AS Frakt
FROM
	Sales.SalesOrderHeader
GROUP BY ROLLUP --Aggregering för första kolumnen(territoryid)
(				--och totalt
	TerritoryID
	,YEAR(Orderdate)--Totalt
	)  ORDER BY År

SELECT
	TerritoryID
	,YEAR(Orderdate) AS År
	,SUM(Freight) AS Frakt
FROM
	Sales.SalesOrderHeader
GROUP BY CUBE --Alla upptänkliga aggregeringar
(				
	TerritoryID
	,YEAR(Orderdate)
	)  ORDER BY År,TerritoryID