SET XACT_ABORT ON--Ett fel avslutar transaktionen

BEGIN TRAN
SELECT @@TRANCOUNT

SELECT 1/0
SELECT @@TRANCOUNT-->0, transaktionen avslutades automatiskt

--�terst�ll
SET XACT_ABORT OFF--�terg� till normall�ge