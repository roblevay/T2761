CREATE TABLE sparkonto (saldo INT)
CREATE TABLE lönekonto (saldo INT)

INSERT INTO sparkonto VALUES (100)
INSERT INTO lönekonto VALUES (100)

--Ändra som en transaktion
BEGIN TRAN
	UPDATE sparkonto SET saldo+=50
	UPDATE lönekonto SET saldo -=50

SELECT * FROM sparkonto,lönekonto
--Allt är rätt, committa
COMMIT TRAN

--Tänk om jag gör fel
BEGIN TRAN
	UPDATE sparkonto SET saldo+=50
	UPDATE lönekonto SET saldo -=25
SELECT * FROM sparkonto,lönekonto
--Det blev fel, rulla tilbaks!
ROLLBACK TRAN