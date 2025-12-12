CREATE OR ALTER PROC dbo.hejproc
AS
PRINT 'Hejsan'
GO

EXEC dbo.hejproc

EXEC sp_helptext 'dbo.hejproc'--Definition

DROP PROC dbo.hejproc--Ta bort
