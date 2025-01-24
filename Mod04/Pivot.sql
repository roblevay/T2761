--Snittpriset per  färg och år?
SELECT
	YEAR(sellstartdate) AS År
	,color
	,ListPrice INTO #produkter
FROM
	Production.product

--Skapa en pivoteringar.
SELECT * FROM #produkter


SELECT * FROM									--Ta fram alla kolumner
(SELECT * FROM #produkter) AS d					--Utgångsdata
PIVOT(AVG(Listprice)							--Vad inuti tabellen
FOR År IN([2008],[2011],[2012],[2013])			--Kolumner
)	AS pvt	

SELECT DISTINCT ÅR FROM  #produkter