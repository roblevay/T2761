SELECT * INTO prodcopy FROM Production.Product

--oops!
BEGIN TRAN--Vi l�ser tabellen
UPDATE Production.Product SET color='Turkos'

SELECT * FROM Production.Product

--Vi rullar tillbaka!
ROLLBACK TRAN