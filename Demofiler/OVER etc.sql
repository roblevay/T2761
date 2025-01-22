-- Skapa en exempeltabell Sales DROP TABLE sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleYear INT,
    Seller NVARCHAR(100),
    Product NVARCHAR(100),
    Amount INT
);

-- Lägg till exempeldata i Sales
INSERT INTO Sales (SaleID, SaleYear, Seller, Product, Amount)
VALUES
(1, 2019, 'Anna', 'Laptop', 15),
(2, 2019, 'Bertil', 'Laptop', 10),
(3, 2019, 'Anna', 'Phone', 12),
(4, 2019, 'Cecilia', 'Laptop', 8),
(5, 2019, 'Anna', 'Phone', 11),
(6, 2019, 'Bertil', 'Phone', 14),
(7, 2019, 'Cecilia', 'Headphone', 20),
(8, 2020, 'Anna', 'Laptop', 25),
(9, 2020, 'Bertil', 'Laptop', 30),
(10, 2020, 'Anna', 'Phone', 18),
(11, 2020, 'Cecilia', 'Laptop', 15),
(12, 2020, 'Anna', 'Phone', 19),
(13, 2020, 'Bertil', 'Phone', 24),
(14, 2020, 'Cecilia', 'Headphone', 27),
(15, 2021, 'Anna', 'Laptop', 35),
(16, 2021, 'Bertil', 'Laptop', 40),
(17, 2021, 'Anna', 'Phone', 22),
(18, 2021, 'Cecilia', 'Laptop', 29),
(19, 2021, 'Anna', 'Phone', 25),
(20, 2021, 'Bertil', 'Phone', 30);

-- Beräkna den kumulativa försäljningen för varje produkt av varje säljare, ordnat efter försäljningsår
SELECT 
    SaleYear, 
    Seller, 
    Product, 
    Amount,
    SUM(Amount) OVER(PARTITION BY Seller, Product ORDER BY SaleYear) AS CumulativeSales
FROM Sales
ORDER BY Seller, Product, SaleYear;
