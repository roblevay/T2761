USE tempdb
-- Skapa en exempeltabell Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100)
);

-- Skapa en exempeltabell Skills
CREATE TABLE Skills (
    EmployeeID INT,
    Skill NVARCHAR(100)
);

-- L�gg till exempeldata i Employees
INSERT INTO Employees (EmployeeID, EmployeeName)
VALUES
(1, 'Anna'),
(2, 'Bertil'),
(3, 'Cecilia'),
(4, 'David');

-- L�gg till exempeldata i Skills
INSERT INTO Skills (EmployeeID, Skill)
VALUES
(1, 'SQL'),
(2, 'Python'),
(3, 'Java'),
(3, 'C#');  -- Observera att Cecilia har tv� f�rdigheter

-- Skapa en TVF f�r att h�mta f�rdigheter f�r en given anst�lld
CREATE FUNCTION GetSkills(@EmpID INT)
RETURNS TABLE
AS
RETURN (
    SELECT Skill FROM Skills WHERE EmployeeID = @EmpID
);

-- Anv�nda CROSS APPLY med TVF
SELECT e.EmployeeName, s.Skill
FROM Employees e
CROSS APPLY GetSkills(e.EmployeeID) s;

-- Anv�nda OUTER APPLY med TVF
SELECT e.EmployeeName, s.Skill
FROM Employees e
OUTER APPLY GetSkills(e.EmployeeID) s;
