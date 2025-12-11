--Öppna fönstret med OVER
SELECT 
	* 
	,SUM(Ordersumma) OVER() AS TotalSumma
	--,SUM(Ordersumma) OVER(PARTITION BY År) AS SumPerÅr
	,SUM(Ordersumma) OVER(PARTITION BY TerriTorium) AS SumPerTerr 
FROM 
	salesterritory