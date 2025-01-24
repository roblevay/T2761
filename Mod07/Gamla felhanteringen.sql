DROP TABLE IF EXISTS feltabell
CREATE TABLE feltabell (fel INT)

SELECT 1/0

DECLARE @var1 VARCHAR(50)= @@error
INSERT INTO feltabell VALUES (@var1)

SELECT * FROM feltabell