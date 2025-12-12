DROP TABLE IF EXISTS sparkonto
CREATE TABLE sparkonto
(
saldo	INT
)
DROP TABLE IF EXISTS lönekonto
CREATE TABLE lönekonto
(
saldo	INT
)

INSERT INTO sparkonto VALUES(100)
INSERT INTO lönekonto VALUES(100)

UPDATE sparkonto SET saldo+=50--Sätt in
UPDATE lönekonto SET saldo-=50--Ta ut

UPDATE sparkonto SET saldo+=50--Sätt in
UPDATE lönekonto SET saldo-='Hej'--Ta ut

SELECT * FROM sparkonto
SELECT * FROM lönekonto--Ojdå

--Gör såhär:
BEGIN TRAN
UPDATE sparkonto SET saldo+=50--Sätt in
UPDATE lönekonto SET saldo-=100--Fel

SELECT (SELECT Saldo FROM sparkonto)+(SELECT Saldo FROM lönekonto)

--Fel, rulla tillbaka
ROLLBACK TRAN

SET XACT_ABORT OFF


