/*
	CHAR	VARCHAR		Inte unicode, en byte per tecken,256 möjligheter
	NCHAR	NVARCHAR	Unicode, två byte per tecken, 256x256~65.000 kombinationer
*/
DROP TABLE IF EXISTS sprak
CREATE TABLE sprak
(
namn	VARCHAR(50)
)

INSERT INTO sprak VALUES ('Україна')

SELECT * FROM sprak

--Med unicode
DROP TABLE IF EXISTS sprak
CREATE TABLE sprak
(
namn	NVARCHAR(50)--Unicode
)

INSERT INTO sprak VALUES (N'Україна')

SELECT * FROM sprak