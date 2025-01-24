--B�rja med ett try-block
BEGIN TRY
	SELECT 1/0 AS Resultat
END TRY

--Sedan ett catch-block om fel uppst�r
BEGIN CATCH
	SELECT ERROR_NUMBER() AS Errnum
	SELECT ERROR_MESSAGE() AS Errmess
	SELECT ERROR_SEVERITY() AS ErrSev
	EXEC dbo.uspLogError--Loggar i en tabell
	--;THROW;--Nu v�cks felet upp igen!
END CATCH

--H�r forts�tter allt som vanligt
SELECT 'Hej och h�' AS Forts�ttning