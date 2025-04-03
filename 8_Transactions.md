## Exercise 1: TRY CATCH Without Transactions

```bash
-- 1.1 Utan TRANSACTION – ett lyckas, ett misslyckas, men det första kvarstår

USE Adventureworks
GO

BEGIN TRY
    -- Detta fungerar: existerande BusinessEntityID
    INSERT INTO Person.PersonPhone (BusinessEntityID, PhoneNumber, PhoneNumberTypeID)
    VALUES (1, '555-1234', 1);

    -- Detta misslyckas: ogiltigt BusinessEntityID
    INSERT INTO Person.PersonPhone (BusinessEntityID, PhoneNumber, PhoneNumberTypeID)
    VALUES (999999, '555-9999', 1);

    PRINT 'Both inserts succeeded.';
END TRY

BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

-- Visa de senaste raderna
SELECT TOP 5 BusinessEntityID, PhoneNumber, ModifiedDate
FROM Person.PersonPhone
ORDER BY ModifiedDate DESC;
```

```bash
-- 1.2 Med TRANSACTION – båda inserts rullas tillbaka om ett misslyckas

BEGIN TRY
	BEGIN TRAN;

    INSERT INTO Person.PersonPhone (BusinessEntityID, PhoneNumber, PhoneNumberTypeID)
    VALUES (1, '555-1234', 1);

    INSERT INTO Person.PersonPhone (BusinessEntityID, PhoneNumber, PhoneNumberTypeID)
    VALUES (999999, '555-9999', 1);

	COMMIT TRAN;
    PRINT 'Both inserts succeeded.';
END TRY

BEGIN CATCH
	ROLLBACK TRAN;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

SELECT TOP 5 BusinessEntityID, PhoneNumber, ModifiedDate
FROM Person.PersonPhone
ORDER BY ModifiedDate DESC;
```

```bash
-- 1.3 Med TRANSACTION – båda inserts lyckas, transaktionen committas

BEGIN TRY
	BEGIN TRAN;

    INSERT INTO Person.PersonPhone (BusinessEntityID, PhoneNumber, PhoneNumberTypeID)
    VALUES (1, '555-1234', 1);

    INSERT INTO Person.PersonPhone (BusinessEntityID, PhoneNumber, PhoneNumberTypeID)
    VALUES (2, '555-9999', 1);

	COMMIT TRAN;
    PRINT 'Both inserts succeeded.';
END TRY

BEGIN CATCH
	ROLLBACK TRAN;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

SELECT TOP 5 BusinessEntityID, PhoneNumber, ModifiedDate
FROM Person.PersonPhone
ORDER BY ModifiedDate DESC;
```
