USE AdventureWorks
--Ta fram de 10 dyraste produkterna i bokstavsordning

SELECT * FROM						--Yttre fråga
	(SELECT TOP 10					--Inre fråga
		name,ListPrice
	FROM
		Production.Product
	ORDER BY ListPrice DESC) AS t
ORDER BY Name