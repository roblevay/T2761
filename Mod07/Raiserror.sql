
SELECT 1/0

SELECT * FROM sys.messages
WHERE language_id=1033--Engelska
--meddelanden under 50000 �r systemets meddelanden

EXEC sp_addmessage 50001,15,'Ajd�'

--V�ck detta fel med RAISERROR
RAISERROR (50001,15,1) WITH LOG

--Skapa ett ad-hoc fel
RAISERROR('Vad sysslar du med?',15,1) WITH LOG

--Alternativt, anv�nd THROW f�r att v�cka ett fel
;THROW 50021,'Ser man p�!',1;
