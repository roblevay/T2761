--Börja med att skriva frågan
SELECT TOP 10
	name, ListPrice
FROM
	Production.Product
ORDER BY
		ListPrice DESC
GO
--Skapa sedan vyn
CREATE VIEW dbo.produkt_view AS
SELECT TOP 10
	name, ListPrice
FROM
	Production.Product
ORDER BY
		ListPrice DESC
GO

--Använd vyn
SELECT
	*
FROM
	produkt_view
ORDER BY
	Name
GO
--Exempel
--En användare vill alltid ha fram alla blåa produkter
CREATE VIEW blåaprodukter AS
SELECT
	*
FROM
	Production.Product
WHERE
	Color='blue'
GO
--Använder frågar
SELECT * FROM blåaprodukter