-- Skapa en exempeltabell Sales DROP TABLE sales
CREATE TABLE Sales (
    SaleYear INT,
    Product NVARCHAR(100),
    Amount INT
);

-- Lägg till exempeldata i Sales
INSERT INTO Sales (SaleYear, Product, Amount)
VALUES
(2019, 'Laptop', 100),
(2019, 'Phone', 150),
(2019, 'Headphone', 75),
(2020, 'Laptop', 120),
(2020, 'Phone', 160),
(2020, 'Headphone', 80),
(2021, 'Laptop', 110),
(2021, 'Phone', 170),
(2021, 'Headphone', 90);

SELECT
	*
FROM
	Sales

SELECT
	*
FROM
	(SELECT * FROM Sales) AS d
	PIVOT(SUM(Amount) FOR Saleyear IN([2019],[2020],[2021])) AS pvt

--Skapa en tabell med SELECT INTO
SELECT
	*
INTO pivottabell
FROM
	(SELECT * FROM Sales) AS d
	PIVOT(SUM(Amount) FOR Saleyear IN([2019],[2020],[2021])) AS pvt

SELECT * FROM pivottabell


--Unpivot:

SELECT
    Product,
    SaleYear = CAST(SaleYear AS int),
    Amount
FROM pivottabell
UNPIVOT
(
    Amount FOR SaleYear IN ([2019], [2020], [2021])
) u




-- Använda PIVOT för att transformera produkter till kolumner
SELECT SaleYear, 
       [Laptop], 
       [Phone], 
       [Headphone]
FROM 
(
    SELECT SaleYear, Product, Amount
    FROM Sales
) AS SourceTable
PIVOT
(
    SUM(Amount)
    FOR Product IN ([Laptop], [Phone], [Headphone])
) AS PivotTable
ORDER BY SaleYear;
