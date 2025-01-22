-- Skapa en exempeltabell Sales DROP TABLE Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    SaleYear INT,
    Seller NVARCHAR(100),
    Amount INT
);

-- L�gg till exempeldata i Sales
INSERT INTO Sales (SaleYear, Seller, Amount)
VALUES
(2019, 'Anna', 1000),
(2020, 'Anna', 1100),
(2021, 'Anna', 1050),

(2019, 'Bertil', 900),
(2020, 'Bertil', 920),
(2021, 'Bertil', 940),

(2019, 'Cecilia', 850),
(2020, 'Cecilia', 860),
(2021, 'Cecilia', 890),

(2019, 'David', 950),
(2020, 'David', 980),
(2021, 'David', 1000),

(2019, 'Eva', 970),
(2020, 'Eva', 1010),
(2021, 'Eva', 1020),

(2019, 'Fredrik', 880),
(2020, 'Fredrik', 915),
(2021, 'Fredrik', 925),

(2019, 'Greta', 1070),
(2020, 'Greta', 1080),
(2021, 'Greta', 1100),

(2019, 'Hugo', 990),
(2020, 'Hugo', 1005),
(2021, 'Hugo', 1030),

(2019, 'Ida', 920),
(2020, 'Ida', 930),
(2021, 'Ida', 940),

(2019, 'Johan', 940),
(2020, 'Johan', 960),
(2021, 'Johan', 975);

-- Anv�nd LAG funktionen f�r att visa f�rs�ljningen fr�n f�reg�ende �r f�r varje s�ljare
SELECT 
    SaleYear, 
    Seller, 
    Amount,
    LAG(Amount, 1, 0) OVER(PARTITION BY Seller ORDER BY SaleYear) AS PreviousYearAmount
FROM Sales
ORDER BY Seller, SaleYear;

--J�mf�r f�reg�ende �r
SELECT 
    SaleYear, 
    Seller, 
    Amount,
    LAG(Amount, 1, 0) OVER(PARTITION BY Seller ORDER BY SaleYear) AS PreviousYearAmount
	,amount-LAG(Amount, 1, 0) OVER(PARTITION BY Seller ORDER BY SaleYear) AS F�r�ndring
FROM Sales
ORDER BY Seller, SaleYear;

--Anv�nd cte
WITH cte AS(
SELECT 
    SaleYear, 
    Seller, 
    Amount,
    LAG(Amount, 1, NULL) OVER(PARTITION BY Seller ORDER BY SaleYear) AS PreviousYearAmount
FROM Sales)
SELECT
	*
	,Amount-PreviousYearAmount AS F�r�ndring
	,100.0*(Amount-PreviousYearAmount)/PreviousYearAmount AS F�rProcent
FROM
	cte


