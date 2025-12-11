SELECT
	'Ingen Kund' AS Kund
	,FirstName
	,LastName
FROM
	Person.Person
UNION
SELECT 
	CompanyName
	,FirstName
	,LastName
FROM AdventureWorksLT.SalesLT.Customer