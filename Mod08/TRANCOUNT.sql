SELECT @@TRANCOUNT--Antal aktiva transaktioner

BEGIN TRAN--@@TRANCOUNT �kar med 1
BEGIN TRAN--@@TRANCOUNT �kar med 1

COMMIT TRAN--@@TRANCOUNT minskar med 1

ROLLBACK TRAN--@@TRANCOUNT blir 0