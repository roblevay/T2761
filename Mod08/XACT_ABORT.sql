SET XACT_ABORT ON--Ett fel avslutar transaktionen

BEGIN TRAN
SELECT @@TRANCOUNT

SELECT 1/0
SELECT @@TRANCOUNT-->0, transaktionen avslutades automatiskt

--Återställ
SET XACT_ABORT OFF--Återgå till normalläge