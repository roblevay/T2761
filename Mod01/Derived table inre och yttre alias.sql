USE AdventureWorks
--Kolumnnamn/alias kan vara i yttre eller inre frågan
--I den inre:
SELECT * FROM						
	(SELECT TOP 10					
		name AS namn,ListPrice AS Pris
	FROM
		Production.Product
	ORDER BY ListPrice DESC) AS t
ORDER BY namn

--I den yttre
SELECT * FROM						
	(SELECT TOP 10					
		name ,ListPrice 
	FROM
		Production.Product
	ORDER BY ListPrice DESC) AS t(Namn,Listpris)
ORDER BY namn

