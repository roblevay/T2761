USE AdventureWorks
--Ta fram de 10 dyraste produkterna i bokstavsordning
SELECT 
	*
FROM
	(SELECT TOP 10
		name, ListPrice
	FROM
		Production.Product
	ORDER BY
		ListPrice DESC) AS t
ORDER BY Name

--Alias i den inre tabellen
SELECT 
	*
FROM
	(SELECT TOP 10
		name AS Namn, ListPrice AS Pris
	FROM
		Production.Product
	ORDER BY
		ListPrice DESC) AS t
ORDER BY Namn

--Alias i den yttre tabellen
SELECT 
	*
FROM
	(SELECT TOP 10
		name , ListPrice
	FROM
		Production.Product
	ORDER BY
		ListPrice DESC) AS t(namn,pris)--Kolumnnamn
ORDER BY Namn

--Detta funkar inte, alla kolummner måste ha alias
SELECT 
	*
FROM
	(SELECT TOP 10
		LOWER(name) , ListPrice
	FROM
		Production.Product
	ORDER BY
		ListPrice DESC) AS t


	