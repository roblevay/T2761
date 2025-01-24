CREATE OR ALTER PROC info_proc
AS
DECLARE
	@datum VARCHAR(50)
	,@server VARCHAR(50)
	,@msg VARCHAR(200)
SET @datum =CONVERT(VARCHAR(50),GETDATE(),23)
SET @server=@@SERVERNAME
SET @msg='Dagens datum är: '+@datum
+' och serverns namn är '+@server+'.'
PRINT @msg
GO

EXEC info_proc