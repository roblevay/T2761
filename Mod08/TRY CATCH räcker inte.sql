DROP TABLE IF EXISTS dagar
CREATE TABLE dagar
(
dag	INT
)

--Vi vill lägga till två dagar
BEGIN TRY--Vi vill att båda ska läggas till
	INSERT INTO dagar VALUES ('1')
	INSERT INTO dagar VALUES ('1x')
END TRY

BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrMess
END CATCH

SELECT * FROM dagar
