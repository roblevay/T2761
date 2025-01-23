--Skapa tabell för demo
SELECT
	*
INTO
	produkter
FROM
	Production.Product
GO

UPDATE produkter SET ModifiedDate=GETDATE()
WHERE Color='Red'
GO

CREATE OR ALTER FUNCTION dbo.produkteridag (@datum DATE = NULL)
RETURNS TABLE
AS
RETURN
SELECT 
	*
FROM
	produkter
WHERE
	CAST(ModifiedDate AS DATE) = ISNULL(@datum, CAST(GETDATE() AS DATE))
GO



SELECT * FROM dbo.produkteridag('2025-01-23')

