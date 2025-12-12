BEGIN TRY
	SELECT 1/0
	--SELECT 1/0 AS Resultat
END TRY

BEGIN CATCH
	SELECT 
		ERROR_MESSAGE() AS ErrMess
		,ERROR_NUMBER() AS ErrNum
		,ERROR_SEVERITY() AS ErrSev
		,@@ERROR AS OldErrNum
END CATCH


--Här fortsätter allt
SELECT 'Hej och hå'