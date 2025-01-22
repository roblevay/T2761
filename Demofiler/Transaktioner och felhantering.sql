USE tempdb

CREATE TABLE SampleData (
    ID INT PRIMARY KEY,
    DataValue NVARCHAR(50)
);

BEGIN TRY
    BEGIN TRANSACTION; -- Starta transaktion

    -- Infoga en ny post
    INSERT INTO SampleData (ID, DataValue) VALUES (1, 'First Value');

    -- Infoga en annan post (detta kommer att orsaka ett fel eftersom ID 1 redan finns)
    INSERT INTO SampleData (ID, DataValue) VALUES (1, 'Second Value');

    COMMIT TRANSACTION; -- Commit transaktionen om allt går bra
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION; -- Återställ transaktionen om något fel uppstår

    -- Utskrift av felmeddelande
    PRINT ERROR_MESSAGE();
END CATCH

select * from SampleData
