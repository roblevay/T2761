USE AdventureWorks

--Skapa synonym för tabell i annan databas
CREATE SYNONYM dbo.produkter FOR 
adventureworkslt.saleslt.product

--Använd
SELECT * FROM produkter