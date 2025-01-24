SELECT
	TerritoryID
	,YEAR(Orderdate) AS �r
	,SUM(Freight) AS Frakt
FROM
	Sales.SalesOrderHeader
GROUP BY GROUPING SETS
(	
	(TerritoryID)			--Per territorium
	,(YEAR(OrderDate))		--Per �r
	,()						--Totalt
	) 

	--Utan grouping sets
SELECT
	TerritoryID
	,YEAR(Orderdate) AS �r
	,SUM(Freight) AS Frakt
FROM
	Sales.SalesOrderHeader 
GROUP BY
	TerritoryID
	,YEAR(OrderDate) ORDER BY 1,2