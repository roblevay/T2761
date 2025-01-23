--Jag vill bjuda in personer från två tabeller
SELECT FirstName,LastName,MiddleName FROM AdventureWorks.Person.Person
UNION
SELECT FirstName,LastName,MiddleName FROM AdventureworksLT.SalesLT.Customer

--Vilka finns i båda tabellerna, matchande
SELECT FirstName,LastName,MiddleName FROM AdventureWorks.Person.Person
INTERSECT
SELECT FirstName,LastName,MiddleName FROM AdventureworksLT.SalesLT.Customer


CREATE TABLE Europaländer
(
namn	VARCHAR(50)
)

CREATE TABLE Engelsktalande
(
namn	VARCHAR(50)
)

INSERT INTO Europaländer VALUES ('Sverige')
INSERT INTO Europaländer VALUES ('Norge')
INSERT INTO Europaländer VALUES ('England')

INSERT INTO Engelsktalande VALUES('England')
INSERT INTO Engelsktalande VALUES('USA')
INSERT INTO Engelsktalande VALUES('Australien')

SELECT * FROM Europaländer
INTERSECT--Finns med i båda
SELECT * FROM Engelsktalande

SELECT * FROM Europaländer
UNION--Alla rader
SELECT * FROM Engelsktalande

SELECT * FROM Europaländer
UNION ALL--Alla rader utan att ta bort dubletter, England med två gånger
SELECT * FROM Engelsktalande


SELECT * FROM Europaländer
EXCEPT--Alla från övre UTOM om den finns i den nedre
SELECT * FROM Engelsktalande

SELECT * FROM Engelsktalande
EXCEPT--Alla från övre UTOM om den finns i den nedre
SELECT * FROM Europaländer

