--Använd temporär tabell
--Temporär tabell
--Nackdelar
--1. Ofta sämre prestanda
--2. Svämma över databasen tempdb
SELECT TOP 10					
	name ,ListPrice 
INTO #dyraprodukter
FROM
	Production.Product
ORDER BY ListPrice DESC

SELECT * FROM #dyraprodukter ORDER BY Name