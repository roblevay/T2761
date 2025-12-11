--Skapa vy
CREATE OR ALTER VIEW dbo.vw_dyraprodukter AS
SELECT TOP 10					
	name ,ListPrice 
FROM
	Production.Product
ORDER BY ListPrice DESC
GO

EXEC sp_helptext 'dbo.vw_dyraprodukter'--Vydefinition

DROP VIEW dbo.vw_dyraprodukter--Ta bort

--Använd vyn
SELECT
	*
FROM
	dbo.vw_dyraprodukter
ORDER BY
	name

--Behörigheter
CREATE USER benny WITHOUT LOGIN

GRANT SELECT ON dbo.vw_dyraprodukter TO benny

EXECUTE AS USER='Benny'
SELECT * FROM dbo.vw_dyraprodukter--Funkar
REVERT


EXECUTE AS USER='Benny'
SELECT * FROM Production.Product--Funkar inte
REVERT
