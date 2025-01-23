--Skapa en tempor�r tabell och fr�ga p� den

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

--Steg 2, fr�ga p� tabellen
SELECT
	*
FROM
	#dyraprodukter
ORDER BY 
	Name