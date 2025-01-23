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

CREATE OR ALTER FUNCTION dbo.produkteridag (@datum DATE )
RETURNS TABLE
AS
RETURN
SELECT 
	*
FROM
	produkter
WHERE
	CAST(Modifieddate AS DATE)=@datum
GO


SELECT * FROM dbo.produkteridag('2025-01-23')

