## Exercise 1: Raising Errors

USE Adventureworks
GO

```bash
-- 1.1 Skapa ett eget felmeddelande och logga det

RAISERROR('Unknown Error. Call helpdesk!', 16, 1) WITH LOG;
```

```bash
-- 1.2 Gå till SQL Server Logs under "Management" i Object Explorer
-- och bekräfta att felet loggats där.
```

```bash
-- 1.3 Använd THROW för att skapa ett anpassat undantag

;THROW 50010, 'This is not the intended behavior', 1;
```

---

## Exercise 2: TRY CATCH

```bash
-- 2.1 Hantera fel med TRY...CATCH

USE Adventureworks
GO

BEGIN TRY
    -- Försök skriva text till en kolumn som kräver numeriskt värde
    UPDATE Sales.SalesOrderDetail
    SET OrderQty = 'ABC'
    WHERE SalesOrderDetailID = 1;
END TRY

BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
```

```bash
-- Visa att koden fortsätter efter felet

SELECT TOP 5 * FROM Sales.SalesOrderDetail;
```
