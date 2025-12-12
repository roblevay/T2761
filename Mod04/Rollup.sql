SELECT
	TerritoryID
	,YEAR(Orderdate) AS År
	,SUM(Freight) AS Frakt
FROM
	Sales.SalesOrderHeader
GROUP BY ROLLUP(	--Aggregering för första kolumnen
	TerritoryID
	,YEAR(Orderdate))
ORDER BY 1,2