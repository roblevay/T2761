--Vi vill ha produkter med en viss f�rg
CREATE FUNCTION dbo.produktermedfarg(@color VARCHAR(50))
RETURNS TABLE 
AS 
RETURN
	SELECT 
		*
	FROM
		Production.Product 
	WHERE
		color=@color
GO

--Anv�ndare kan fr�ga mot funktionen som 
--mot en tabell
SELECT
	*
FROM
	dbo.produktermedfarg('Vet ej')