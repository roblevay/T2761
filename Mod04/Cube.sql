SELECT
	TerritoryID
	,YEAR(Orderdate) AS År
	,SUM(Freight) AS Frakt
FROM
	Sales.SalesOrderHeader
GROUP BY CUBE(	--Alla upptänkliga aggregeringar
	TerritoryID
	,YEAR(Orderdate))
ORDER BY 1,2