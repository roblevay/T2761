DECLARE @prodid INT =1,@prodname VARCHAR(50)
WHILE @prodid <=5
	BEGIN
		SELECT @prodname=name FROM Production.Product
			WHERE ProductID=@prodid
		PRINT @prodname
		SET @prodid+=1
	END