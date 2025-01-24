
SELECT 1/0

SELECT * FROM sys.messages
WHERE language_id=1033--Engelska
--meddelanden under 50000 är systemets meddelanden

EXEC sp_addmessage 50001,15,'Ajdå'

--Väck detta fel med RAISERROR
RAISERROR (50001,15,1) WITH LOG

--Skapa ett ad-hoc fel
RAISERROR('Vad sysslar du med?',15,1) WITH LOG

--Alternativt, använd THROW för att väcka ett fel
;THROW 50021,'Ser man på!',1;
