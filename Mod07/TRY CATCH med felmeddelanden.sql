--Börja med ett try-block
BEGIN TRY
	SELECT 1/0 AS Resultat
END TRY

--Sedan ett catch-block om fel uppstår
BEGIN CATCH
	SELECT ERROR_NUMBER() AS Errnum
	SELECT ERROR_MESSAGE() AS Errmess
	SELECT ERROR_SEVERITY() AS ErrSev
	EXEC dbo.uspLogError--Loggar i en tabell
	--;THROW;--Nu väcks felet upp igen!
END CATCH

--Här fortsätter allt som vanligt
SELECT 'Hej och hå' AS Fortsättning