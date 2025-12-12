--Påbörja transaktion
BEGIN TRAN

ROLLBACK TRAN--Rulla tillbaka
COMMIT TRAN--Fullborda transaktionen

SELECT @@TRANCOUNT--Hur många öppna transaktioner