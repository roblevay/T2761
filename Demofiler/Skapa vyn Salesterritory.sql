USE Adventureworks
GO
CREATE OR ALTER VIEW salesterritory AS
SELECT
	name AS Territorium
	,YEAR(Orderdate) AS År
	,CAST(SUM(Totaldue)AS INT) AS Ordersumma
FROM
	Sales.SalesTerritory AS t INNER JOIN Sales.SalesOrderHeader	AS s
	ON t.TerritoryID=s.TerritoryID
GROUP BY
	name
	,YEAR(Orderdate)
GO

SELECT * FROM salesterritory