USE Tempdb
-- Skapa tabellen och infoga exempeldata
CREATE TABLE SalesData (
    Year INT,
    Department NVARCHAR(50),
    SalesAmount DECIMAL(18,2)
);

INSERT INTO SalesData (Year, Department, SalesAmount)
VALUES 
(2019, 'TeknikTigrarna', 1000.00),
(2019, 'DesignDrakarna', 1100.00),
(2019, 'MarknadsMästarna', 1200.00),
(2020, 'TeknikTigrarna', 1050.00),
(2020, 'DesignDrakarna', 1150.00),
(2020, 'MarknadsMästarna', 1250.00),
(2021, 'TeknikTigrarna', 1100.00),
(2021, 'DesignDrakarna', 1200.00),
(2021, 'MarknadsMästarna', 1300.00);

-- Utför analyser med OVER() och PARTITION BY
SELECT 
    Year,
    Department,
    SalesAmount,
    SUM(SalesAmount) OVER (PARTITION BY Department) AS TotalSalesPerDepartment,
    SUM(SalesAmount) OVER (PARTITION BY Department ORDER BY Year) AS RunningTotal
FROM SalesData
ORDER BY Department, Year;
