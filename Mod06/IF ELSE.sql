IF 22>12
	PRINT 'St�rre �n'
ELSE
	PRINT 'Inte st�rre �n'

--Kapsla in olika block med BEGIN och END

IF 22<12
	BEGIN
		PRINT 'St�rre �n'
		PRINT 'Fattar du v�l'
	END
ELSE
	BEGIN
		PRINT 'Inte st�rre �n'
		PRINT 'S�klart'
	END


IF 22<12--If-villkoret g�ller bara f�rsta raden
	PRINT 'St�rre �n'
	PRINT 'Fattar du v�l'--Detta skrivs alltid ut