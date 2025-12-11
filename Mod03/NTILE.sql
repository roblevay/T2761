--Dela upp i olika grupper
SELECT
	Name
	,ListPrice
	,NTILE(3) OVER(ORDER BY Listprice DESC) AS PrisGrp
FROM
	Production.Product

--Med verbala ankare
SELECT
	Name
	,ListPrice
	,
		CASE
			WHEN NTILE(3) OVER(ORDER BY Listprice DESC) =1 THEN 'Dyr'
			WHEN NTILE(3) OVER(ORDER BY Listprice DESC) =2 THEN 'Medel'
			WHEN NTILE(3) OVER(ORDER BY Listprice DESC) =3 THEN 'Billig'
		END 		
			AS PrisGrp
FROM
	Production.Product