CREATE TABLE engelsktalande
(
namn	VARCHAR(50)
)

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

--UNION DISTINCT, tar bort dubletter
SELECT * FROM engelsktalande
UNION--Alla från båda tabellerna
SELECT * FROM europaländer

--UNION ALL, tar INTE bort dubletter
SELECT * FROM engelsktalande
UNION ALL
SELECT * FROM europaländer

