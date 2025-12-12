DECLARE @color VARCHAR(50)='Red'--Detta funkar
SELECT
	*
FROM
	Production.Product
WHERE 
	Color=@color

--Detta funkar inte
DECLARE @tabell VARCHAR(100)='Production.product'
SELECT
	*
FROM
	@tabell

--Använd dynamisk sql
--Tänk på:
	--Använd unicode
	--Använd EXEC sp_exutesql för att köra
GO
DECLARE 
	@tabell NVARCHAR(100)='Production.product'
	,@cmd NVARCHAR(200)
SET @cmd='SELECT * FROM '+@tabell
--PRINT @cmd
EXEC sp_executesql @cmd
