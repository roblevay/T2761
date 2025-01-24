--Börja med ett try-block
BEGIN TRY
	SELECT 1/0 AS Resultat
END TRY

--Sedan ett catch-block om fel uppstår
BEGIN CATCH
	SELECT 'Ajajaj' AS Felmeddelande
END CATCH

--Här fortsätter allt som vanligt
SELECT 'Hej och hå' AS Fortsättning