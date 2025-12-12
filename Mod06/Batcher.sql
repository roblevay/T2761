DROP TABLE IF EXISTS tabell11
CREATE TABLE tabell11 (Col1 INT)
--Syntax fel, funkar inte
INSERT INTO tabell1 VALUES ('2')
INSERT INTO tabell1 VALUES (4

--Detta funkar, syntaxen är ok men ett värde fel datatyp
INSERT INTO tabell11 VALUES ('2')
INSERT INTO tabell11 VALUES ('Fyra')

SELECT * FROM tabell11