WITH cte AS
(
SELECT TOP 10					
	name ,ListPrice 
FROM
	Production.Product
ORDER BY ListPrice DESC
)
SELECT * FROM cte ORDER BY name

--Kolumnnamn i yttre frågan
WITH cte(Namn,Listpris) AS
(
SELECT TOP 10					
	name ,ListPrice 
FROM
	Production.Product
ORDER BY ListPrice DESC
)
SELECT * FROM cte ORDER BY Namn