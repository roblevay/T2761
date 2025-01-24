--Detta funkar i Adventureworkslt
DECLARE @color VARCHAR(50)='Blue'
SELECT * FROM SalesLT.Product WHERE color=@color

--Men vissa saker funkar inte
DECLARE @mytable VARCHAR(50)='saleslt.product'
SELECT * FROM @mytable
GO
--D� kan det blir n�dv�ndigt med dynamisk sql
--Detta inneb�r att skapa en sql-sats och
--skicka den f�r exekvering

DECLARE 
	@mytable NVARCHAR(50)='saleslt.product'
	,@cmd NVARCHAR(200)
SET @cmd='SELECT * FROM '+@mytable
--PRINT @cmd				--Testa f�rst
EXEC sp_executesql @cmd		--K�r satsen

