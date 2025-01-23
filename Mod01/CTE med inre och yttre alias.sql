WITH cte AS
(
SELECT TOP 10
		name, ListPrice
	FROM
		Production.Product
	ORDER BY
		ListPrice DESC
)
SELECT * FROM cte ORDER BY Name

--Ange alias i inre fr�gan
WITH cte AS
(
SELECT TOP 10
		LOWER(name) AS Namn, ListPrice
	FROM
		Production.Product
	ORDER BY
		ListPrice DESC
)
SELECT * FROM cte ORDER BY Namn

--Ange alias i yttre fr�gan
WITH cte(Namn,Listpris) AS
(
SELECT TOP 10
		name, ListPrice
	FROM
		Production.Product
	ORDER BY
		ListPrice DESC
)
SELECT * FROM cte ORDER BY Namn

