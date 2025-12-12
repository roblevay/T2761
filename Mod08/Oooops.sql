--skapa en tabell som är en kopia
SELECT * INTO prods FROM Production.Product

DELETE prods

SELECT * FROM prods--Oooops!

--Gör såhär:
SELECT * INTO prods2 FROM Production.Product

BEGIN TRAN
	DELETE prods2
	SELECT * FROM prods2--tom
ROLLBACK TRAN

SELECT * FROM prods2--Den har återuppstått