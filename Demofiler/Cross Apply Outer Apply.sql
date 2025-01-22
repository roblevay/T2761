-- Skapa en exempeltabell Employees
USE tempdb
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100)
);

-- Skapa en exempeltabell Skills
CREATE TABLE Skills (
    EmployeeID INT,
    Skill NVARCHAR(100)
);

-- Lägg till exempeldata i Employees
INSERT INTO Employees (EmployeeID, EmployeeName)
VALUES
(1, 'Anna'),
(2, 'Bertil'),
(3, 'Cecilia'),
(4, 'David');

-- Lägg till exempeldata i Skills
INSERT INTO Skills (EmployeeID, Skill)
VALUES
(1, 'SQL'),
(2, 'Python'),
(3, 'Java'),
(3, 'C#');  -- Observera att Cecilia har två färdigheter

-- Använda CROSS APPLY
SELECT e.EmployeeName, s.Skill
FROM Employees e
CROSS APPLY (
    SELECT Skill FROM Skills WHERE EmployeeID = e.EmployeeID
) s;

-- Använda OUTER APPLY
SELECT e.EmployeeName, s.Skill
FROM Employees e
OUTER APPLY (
    SELECT Skill FROM Skills WHERE EmployeeID = e.EmployeeID
) s;
