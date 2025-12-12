SET XACT_ABORT ON--Transaktionen rullas
--tillbaks automatiskt vid fel
BEGIN TRAN
	SELECT @@TRANCOUNT--> 1
	SELECT 1/0--> Fel
	SELECT @@TRANCOUNT-->0


