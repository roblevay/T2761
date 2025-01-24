USE AdventureworksLT

--Jag vill fråga på en tabell i en annan databas
SELECT * FROM AdventureWorks.Person.Person

--Skapa en synonym
CREATE SYNONYM dbo.personer
FOR  AdventureWorks.Person.Person
GO

--Använd:
SELECT * FROM personer