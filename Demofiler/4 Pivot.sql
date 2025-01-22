--Skapa tabell f�r pivotering
SELECT
	t1.name AS Territorium
	,YEAR(Orderdate) AS �r
	,SUM(Freight) AS Frakt INTO Pivottable
FROM
	Sales.SalesTerritory AS t1 INNER JOIN Sales.SalesOrderHeader AS t2
	ON t1.TerritoryID=t2.TerritoryID
GROUP BY
	t1.name
	,YEAR(Orderdate) 

--DROP TABLE Pivottable

SELECT
	*
FROM
	Pivottable ORDER BY 1,2

SELECT *
FROM (SELECT * FROM Pivottable) AS D
PIVOT(SUM(Frakt) FOR �r IN([2011],[2012],[2013],[2014]))  AS pvt 
ORDER BY Territorium