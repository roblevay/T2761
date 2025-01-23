USE tempdb

-- Skapa TableA
CREATE TABLE TableA (
    ID INT,
    Name NVARCHAR(50)
);

-- Skapa TableB
CREATE TABLE TableB (
    ID INT,
    Name NVARCHAR(50)
);

-- Lägg till data i TableA
INSERT INTO TableA (ID, Name) VALUES
(1, 'Anna'),
(2, 'Bertil'),
(3, 'Cecilia'),
(4, 'David');

-- Lägg till data i TableB
INSERT INTO TableB (ID, Name) VALUES
(3, 'Cecilia'),
(4, 'David'),
(5, 'Elin'),
(6, 'Fredrik');

SELECT * FROM TableA
SELECT * FROM TableB

-- INTERSECT: Returnerar rader som finns i båda tabellerna.
SELECT * FROM TableA
INTERSECT
SELECT * FROM TableB;

-- EXCEPT: Returnerar rader från den första tabellen (TableA) som inte finns i den andra tabellen (TableB).
SELECT * FROM TableA
EXCEPT
SELECT * FROM TableB;

--Detta är inte samma som föregående:
SELECT * FROM TableB
EXCEPT
SELECT * FROM TableA;

-- UNION: Kombinerar rader från båda tabellerna och eliminerar dubletter.
SELECT * FROM TableA
UNION
SELECT * FROM TableB;

-- UNION ALL: Kombinerar rader från båda tabellerna och eliminerar INTE dubletter.
SELECT * FROM TableA
UNION ALL
SELECT * FROM TableB;
