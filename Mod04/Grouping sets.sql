SELECT
	TerritoryID
	,YEAR(Orderdate) AS År
	,SUM(Freight) AS Frakt
FROM
	Sales.SalesOrderHeader
GROUP BY GROUPING SETS(	--Skräddarsydd aggregering
	()
	,(Territoryid)
	,(YEAR(Orderdate)))
ORDER BY 1,2