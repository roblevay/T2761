--SELECT * FROM dummytable Test om tabell finnes
USE AdventureWorks
--Skapa tabell f�r test
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

--Detta funkar, s� ska den anv�ndas:
EXEC injection 316

--Missbruk, sql injection
EXEC injection '1;DROP TABLE dummytable'



