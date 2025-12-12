CREATE PROC dbo.namn_proc
(@fornamn	VARCHAR(50)	--Inparametrar kommer före AS
,@efternamn VARCHAR(50))
AS
DECLARE @fulltnamn VARCHAR(200)--Parametrar i proceduren

SET @fulltnamn=@fornamn+' '+@efternamn--Bearbetning

SELECT 'Det fulla namnet år: '+@fulltnamn--Ge resultat

GO

--Kör proceduren med angivande av parametrar
EXEC dbo.namn_proc @fornamn='Robert', @efternamn='Levay'

--Kör proceduren utan angivande av parametrar
EXEC dbo.namn_proc 'Robert', 'Levay'

