CREATE TABLE numbertable (col1 INT)
GO

INSERT INTO numbertable VALUES (10)--Denna g�r igenom 
INSERT INTO numbertable VALUES ('Hej')--men inte denna

SELECT * FROM numbertable

INSERT INTO numbertable VALUES (10)--Inget g�r igenom ,syntaxfel
INSERT INTO numbertable VALUE ('Hej')--