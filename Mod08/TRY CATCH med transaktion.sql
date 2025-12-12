DROP TABLE IF EXISTS dagar
CREATE TABLE dagar
(
dag	INT
)

--Vi vill lägga till två dagar
BEGIN TRY--Vi vill att båda ska läggas till
	BEGIN TRAN
		INSERT INTO dagar VALUES ('1')
		INSERT INTO dagar VALUES ('2')
	COMMIT TRAN
END TRY

BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrMess
	ROLLBACK TRAN
END CATCH


SELECT 'jajaja'


SELECT * FROM dagar
