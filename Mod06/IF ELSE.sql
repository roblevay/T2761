IF 22>12
	PRINT 'Större än'
ELSE
	PRINT 'Inte större än'

--Kapsla in olika block med BEGIN och END

IF 22<12
	BEGIN
		PRINT 'Större än'
		PRINT 'Fattar du väl'
	END
ELSE
	BEGIN
		PRINT 'Inte större än'
		PRINT 'Såklart'
	END


IF 22<12--If-villkoret gäller bara första raden
	PRINT 'Större än'
	PRINT 'Fattar du väl'--Detta skrivs alltid ut