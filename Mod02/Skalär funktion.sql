CREATE OR ALTER FUNCTION dbo.fn_dubblera (@tal INT)
RETURNS INT
AS

BEGIN
	DECLARE @svar INT
	SET @svar=@tal*2
	RETURN @svar
END
GO
	
SELECT dbo.fn_dubblera(22)