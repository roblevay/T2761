--Skapa en temporär tabell och fråga på den

--Steg 1, skapa tabellen
SELECT TOP 10 
		name
		, ListPrice
INTO 
	#dyraprodukter
FROM
	Production.Product
ORDER BY
		ListPrice DESC

DROP TABLE #dyraprodukter

--Steg 2, fråga på tabellen
SELECT
	*
FROM
	#dyraprodukter
ORDER BY 
	Name