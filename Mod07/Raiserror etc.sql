SELECT * FROM sys.messages --WHERE language_id=1033
-- 50.000 och över egendefinierade
SELECT * FROM sys.messages
WHERE language_id=1053


SELECT * FROM sys.syslanguages--Alla språk

EXEC sp_addmessage 50002,10,'Robbans nya fel', @with_log=true

--Väck felet 
RAISERROR (50002,10,1 )

--Väck ett fel ad hoc
RAISERROR ('Ajajaj', 15,1 ) WITH LOG

;THROW 50001, 'Nånting hände',1;--Ad hoc fel med felnummer

SET LANGUAGE SWEDISH