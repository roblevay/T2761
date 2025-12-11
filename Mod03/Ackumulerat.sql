SELECT 
	* 
	,SUM(Ordersumma) OVER() AS TotalSumma
	,SUM(Ordersumma) OVER(PARTITION BY TerriTorium ORDER BY ÅR) 
	AS Ack 
FROM 
	salesterritory
--Annorlunda uttryckt

SELECT 
	* 
	,SUM(Ordersumma) OVER() AS TotalSumma
	,SUM(Ordersumma) OVER(PARTITION BY TerriTorium ORDER BY ÅR 
	ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Ack 
FROM 
	salesterritory