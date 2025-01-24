--Antag att jag vill ta fram alla produkter av en viss 
--färg i databasen AdventureworksLT
CREATE PROC produkter_proc 
--Börja med input parameter
@color VARCHAR(50)
AS
SELECT
	*
FROM
	SalesLT.Product
WHERE
	Color=@color
GO

--Testa med metod 1, med angivande av parameternamn
EXEC produkter_proc @color='Blue'

--Metod 2, utan att ange parameternamnet
EXEC produkter_proc 'Red'

EXEC sp_helptext produkter_proc --Kolla scriptet