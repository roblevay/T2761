--B�rja med ett try-block
BEGIN TRY
	SELECT 1/0 AS Resultat
END TRY

--Sedan ett catch-block om fel uppst�r
BEGIN CATCH
	SELECT 'Ajajaj' AS Felmeddelande
END CATCH

--H�r forts�tter allt som vanligt
SELECT 'Hej och h�' AS Forts�ttning