--Jag vill bjuda in personer fr�n tv� tabeller
SELECT FirstName,LastName,MiddleName FROM AdventureWorks.Person.Person
UNION
SELECT FirstName,LastName,MiddleName FROM AdventureworksLT.SalesLT.Customer

--Vilka finns i b�da tabellerna, matchande
SELECT FirstName,LastName,MiddleName FROM AdventureWorks.Person.Person
INTERSECT
SELECT FirstName,LastName,MiddleName FROM AdventureworksLT.SalesLT.Customer


CREATE TABLE Europal�nder
(
namn	VARCHAR(50)
)

CREATE TABLE Engelsktalande
(
namn	VARCHAR(50)
)

INSERT INTO Europal�nder VALUES ('Sverige')
INSERT INTO Europal�nder VALUES ('Norge')
INSERT INTO Europal�nder VALUES ('England')

INSERT INTO Engelsktalande VALUES('England')
INSERT INTO Engelsktalande VALUES('USA')
INSERT INTO Engelsktalande VALUES('Australien')

SELECT * FROM Europal�nder
INTERSECT--Finns med i b�da
SELECT * FROM Engelsktalande

SELECT * FROM Europal�nder
UNION--Alla rader
SELECT * FROM Engelsktalande

SELECT * FROM Europal�nder
UNION ALL--Alla rader utan att ta bort dubletter, England med tv� g�nger
SELECT * FROM Engelsktalande


SELECT * FROM Europal�nder
EXCEPT--Alla fr�n �vre UTOM om den finns i den nedre
SELECT * FROM Engelsktalande

SELECT * FROM Engelsktalande
EXCEPT--Alla fr�n �vre UTOM om den finns i den nedre
SELECT * FROM Europal�nder

