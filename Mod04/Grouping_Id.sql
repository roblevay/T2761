SELECT
	Color
	,COUNT(*) AS Antal
	,GROUPING_ID(Color)--> 1 om gruppering, 0 annars
FROM
	Production.Product
GROUP BY GROUPING SETS(
	(Color)
	,()
	)