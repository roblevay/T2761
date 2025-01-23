--B�rja med att skriva fr�gan
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

--Anv�nd vyn
SELECT
	*
FROM
	produkt_view
ORDER BY
	Name
GO
--Exempel
--En anv�ndare vill alltid ha fram alla bl�a produkter
CREATE VIEW bl�aprodukter AS
SELECT
	*
FROM
	Production.Product
WHERE
	Color='blue'
GO
--Anv�nder fr�gar
SELECT * FROM bl�aprodukter