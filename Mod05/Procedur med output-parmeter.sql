-- Skapa tabellen Employees
DROP TABLE IF EXISTS Employees
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT
)

-- Lägg till några exempelrader i tabellen
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID)
VALUES (1, 'John', 'Doe', 101),
       (2, 'Jane', 'Smith', 102),
       (3, 'Mike', 'Johnson', 101),
       (4, 'Emily', 'Brown', 103)
GO

-- Skapa en stored procedure med en output-parameter
CREATE OR ALTER PROCEDURE GetEmployeeCount
    @DepartmentID INT,
    @EmployeeCount INT OUTPUT
AS
BEGIN
    SELECT @EmployeeCount = COUNT(*) 
    FROM Employees
    WHERE DepartmentID = @DepartmentID
END
GO
-- Anropa stored procedure och använd output-parametern
DECLARE @Count INT
EXEC GetEmployeeCount @DepartmentID = 103
, @EmployeeCount = @Count OUTPUT

-- Skriv ut resultatet
PRINT 'Antal anställda i avdelningen : ' + CAST(@Count AS VARCHAR)
