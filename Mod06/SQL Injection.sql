--SELECT * FROM dummytable Test om tabell finnes

--Skapa tabell för test
CREATE TABLE dummytable(col1 INT)
GO

CREATE OR ALTER PROC injection(@input VARCHAR(50))
AS
DECLARE @cmd NVARCHAR(200)=
'SELECT * FROM production.product WHERE productid='
+@input
--SELECT @cmd
EXEC sp_executesql    @cmd--Dynamisk sql
GO

--Detta funkar, så ska den användas:
EXEC injection 2

--Missbruk, sql injection
EXEC injection '1;DROP TABLE dummytable'


SELECT * FROM production.product WHERE productid=
1;DROP TABLE dummytable

GO
CREATE OR ALTER PROC injection(@input VARCHAR(50))
AS
IF @input LIKE '%;%' 
	BEGIN
		PRINT 'Ajdå'
		RETURN
	END
DECLARE @cmd NVARCHAR(200)=
'SELECT * FROM production.product WHERE productid='
+@input

--SELECT @cmd
EXEC sp_executesql    @cmd--Dynamisk sql
GO