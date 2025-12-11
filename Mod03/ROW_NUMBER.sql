--Skapa ett ordningsnummer i bokstavsordning
SELECT
	ROW_NUMBER() OVER(ORDER BY Name) AS Radnr
	,Name
FROM
	Production.Product