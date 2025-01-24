DROP TABLE IF EXISTS sparkonto
CREATE TABLE sparkonto (saldo INT)
DROP TABLE IF EXISTS Lönekonto
CREATE TABLE lönekonto (saldo INT)

INSERT INTO sparkonto VALUES (100)
INSERT INTO lönekonto VALUES (100)
--TRY CATCH fångar felet men vi får felaktiga värden
BEGIN TRY
	UPDATE sparkonto SET saldo+=50
	UPDATE sparkonto SET saldo+='i0'
END TRY

BEGIN CATCH
	;THROW;
END CATCH

SELECT * FROM sparkonto,lönekonto

--Använd transaktioner istället!

BEGIN TRY
	BEGIN TRAN
		UPDATE sparkonto SET saldo+=50
		UPDATE lönekonto SET saldo-=50
	COMMIT TRAN
END TRY

BEGIN CATCH
	PRINT 'Detta funkade inte'
	ROLLBACK TRAN
END CATCH

SELECT * FROM sparkonto,lönekonto