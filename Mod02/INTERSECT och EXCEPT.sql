DROP TABLE IF EXISTS engelsktalande
CREATE TABLE engelsktalande
(
namn	VARCHAR(50)
)

DROP TABLE IF EXISTS europaländer
CREATE TABLE europaländer
(
namn	VARCHAR(50)
)

INSERT INTO engelsktalande VALUES ('England')
INSERT INTO engelsktalande VALUES ('Irland')
INSERT INTO engelsktalande VALUES ('Australien')

INSERT INTO europaländer VALUES('England')
INSERT INTO europaländer VALUES('Irland')
INSERT INTO europaländer VALUES('Kroatien')

SELECT * FROM engelsktalande
INTERSECT--Finns BÅDE i A och i B 
SELECT * FROM europaländer

SELECT * FROM engelsktalande
EXCEPT--Finns i övre MEN INTE i nedre
SELECT * FROM europaländer

--Denna är annorlunda än föregående
SELECT * FROM europaländer
EXCEPT--Finns i övre MEN INTE i nedre
SELECT * FROM engelsktalande

