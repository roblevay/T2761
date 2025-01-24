DROP TABLE IF EXISTS sparkonto
CREATE TABLE sparkonto (saldo INT)
DROP TABLE IF EXISTS L�nekonto
CREATE TABLE l�nekonto (saldo INT)

INSERT INTO sparkonto VALUES (100)
INSERT INTO l�nekonto VALUES (100)
--TRY CATCH f�ngar felet men vi f�r felaktiga v�rden
BEGIN TRY
	UPDATE sparkonto SET saldo+=50
	UPDATE sparkonto SET saldo+='i0'
END TRY

BEGIN CATCH
	;THROW;
END CATCH

SELECT * FROM sparkonto,l�nekonto

--Anv�nd transaktioner ist�llet!

BEGIN TRY
	BEGIN TRAN
		UPDATE sparkonto SET saldo+=50
		UPDATE l�nekonto SET saldo-=50
	COMMIT TRAN
END TRY

BEGIN CATCH
	PRINT 'Detta funkade inte'
	ROLLBACK TRAN
END CATCH

SELECT * FROM sparkonto,l�nekonto