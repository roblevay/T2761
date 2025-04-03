## Exercise 1: Batches



```bash
-- 1.1 Variabel + SELECT utan att bryta batch med GO

USE Adventureworks
GO

DECLARE @FirstName NVARCHAR(50);
SET @FirstName = 'John';

-- GO är bortkommenterat eller borttaget
--GO

SELECT * 
FROM Person.Person
WHERE FirstName = @FirstName;
```

---

## Exercise 2: IF…ELSE

```bash
-- 2.1 Enkel IF…ELSE med färgkontroll

DECLARE @color NVARCHAR(20) = 'Red';

IF @color = 'Red'
    PRINT 'Color is Red';
ELSE
    PRINT 'Color is NOT Red';
```

```bash
-- 2.2 IF…ELSE med BEGIN/END för fler rader

DECLARE @color NVARCHAR(20) = 'Red';

IF @color = 'Red'
BEGIN
    PRINT 'Color is Red';
    PRINT 'This message is only for Red products';
END
ELSE
BEGIN
    PRINT 'Color is NOT Red';
END
```

---

## Exercise 3: Synonyms

```bash
-- Skapa en synonym för Production.Product

CREATE SYNONYM MyProducts FOR Production.Product;
```

```bash
-- Använd synonymen som en vanlig tabell

SELECT TOP 5 * FROM MyProducts;
```
