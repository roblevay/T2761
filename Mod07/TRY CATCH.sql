BEGIN TRY
	SELECT 1/0 AS Resultat
END TRY

BEGIN CATCH
	SELECT 'Fel!'
END CATCH


--Här fortsätter allt
SELECT 'Hej och hå'


