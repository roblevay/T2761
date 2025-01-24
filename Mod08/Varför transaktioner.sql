CREATE TABLE sparkonto (saldo INT)
CREATE TABLE l�nekonto (saldo INT)

INSERT INTO sparkonto VALUES (100)
INSERT INTO l�nekonto VALUES (100)

--�ndra som en transaktion
BEGIN TRAN
	UPDATE sparkonto SET saldo+=50
	UPDATE l�nekonto SET saldo -=50

SELECT * FROM sparkonto,l�nekonto
--Allt �r r�tt, committa
COMMIT TRAN

--T�nk om jag g�r fel
BEGIN TRAN
	UPDATE sparkonto SET saldo+=50
	UPDATE l�nekonto SET saldo -=25
SELECT * FROM sparkonto,l�nekonto
--Det blev fel, rulla tilbaks!
ROLLBACK TRAN