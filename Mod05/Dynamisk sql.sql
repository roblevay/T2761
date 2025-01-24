--Detta funkar i Adventureworkslt
DECLARE @color VARCHAR(50)='Blue'
SELECT * FROM SalesLT.Product WHERE color=@color

--Men vissa saker funkar inte
DECLARE @mytable VARCHAR(50)='saleslt.product'
SELECT * FROM @mytable
GO
--Då kan det blir nödvändigt med dynamisk sql
--Detta innebär att skapa en sql-sats och
--skicka den för exekvering

DECLARE 
	@mytable NVARCHAR(50)='saleslt.product'
	,@cmd NVARCHAR(200)
SET @cmd='SELECT * FROM '+@mytable
--PRINT @cmd				--Testa först
EXEC sp_executesql @cmd		--Kör satsen

