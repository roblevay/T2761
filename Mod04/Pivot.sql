--Snittpriset per  f�rg och �r?
SELECT
	YEAR(sellstartdate) AS �r
	,color
	,ListPrice INTO #produkter
FROM
	Production.product

--Skapa en pivoteringar.
SELECT * FROM #produkter


SELECT * FROM									--Ta fram alla kolumner
(SELECT * FROM #produkter) AS d					--Utg�ngsdata
PIVOT(AVG(Listprice)							--Vad inuti tabellen
FOR �r IN([2008],[2011],[2012],[2013])			--Kolumner
)	AS pvt	

SELECT DISTINCT �R FROM  #produkter