CREATE PROC dbo.myproc
AS
PRINT 'Hello'
GO
--K�r procedur
EXEC dbo.myproc
GO
CREATE OR ALTER PROC dbo.myproc
AS
PRINT 'Hello there'
GO
DROP PROC myproc--Ta bort procedur
GO