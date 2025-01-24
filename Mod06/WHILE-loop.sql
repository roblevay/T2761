USE AdventureWorks
--Skriv ut de fem första loginid
DECLARE @empid INT=1,@loginid VARCHAR(50)
WHILE @empid<=5
	BEGIN
		SELECT @loginid=Loginid FROM humanresources.employee
			WHERE @empid=BusinessEntityID
		PRINT @loginid
		SET @empid+=1
	END

