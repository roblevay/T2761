## Exercise 1: Create a Stored Procedure

USE Adventureworks
GO

```bash
-- 1.1 Skapa procedur som returnerar alla svarta produkter

CREATE PROC proc_black_products 
AS
SELECT
	*
FROM
	Production.Product
WHERE
	color = 'Black';
GO
```

```bash
-- 1.2 Kör proceduren

EXEC proc_black_products;
```

```bash
-- 1.3 Skapa procedur med parameter för färg

CREATE PROC proc_products_with_color 
@color VARCHAR(50)
AS
SELECT
	*
FROM
	Production.Product
WHERE
	color = @color;
GO
```

```bash
-- 1.4 Kör proceduren med färg blå

EXEC proc_products_with_color @color = 'blue';

-- eller
EXEC proc_products_with_color 'blue';
```

```bash
-- 1.5 Ändra proceduren så att den bara visar produkter utan SellEndDate

CREATE OR ALTER PROC proc_products_with_color
    @color VARCHAR(50)
AS
    SELECT *
    FROM Production.Product
    WHERE color = @color
      AND SellEndDate IS NULL;
GO
```

```bash
-- 1.6 Kör den uppdaterade proceduren

EXEC proc_products_with_color @color = 'blue';

-- eller
EXEC proc_products_with_color 'blue';
```

---

## Exercise 2: Dynamic SQL

USE Adventureworks
GO

```bash
-- 2.1 Skapa en procedur som läser från valfri tabell

CREATE PROCEDURE proc_select_from_any_table
    @tableName NVARCHAR(50)
AS
    DECLARE @sql NVARCHAR(200);

    SET @sql = 'SELECT * FROM ' + @tableName;

    EXEC sp_executesql @sql;
GO
```

```bash
-- 2.2 Testa att läsa från tabellen Production.Product

EXEC proc_select_from_any_table @tablename = 'Production.Product';
```
