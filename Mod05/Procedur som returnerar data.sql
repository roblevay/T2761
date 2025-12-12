--Ta fram produkter av en viss färg
CREATE PROC dbo.produktermedfarg
@color	VARCHAR(50)
AS
SELECT
	*
FROM
	Production.Product
WHERE
	Color=@color
GO

EXEC dbo.produktermedfarg 'Blue'