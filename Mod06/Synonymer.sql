USE AdventureworksLT

--Jag vill fr�ga p� en tabell i en annan databas
SELECT * FROM AdventureWorks.Person.Person

--Skapa en synonym
CREATE SYNONYM dbo.personer
FOR  AdventureWorks.Person.Person
GO

--Anv�nd:
SELECT * FROM personer