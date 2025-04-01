Snyggt! Här kommer **Exercise 1 och 2** från **modulen Grouping Sets & Pivoting** — snyggt formaterade med `bash`-kodblock så det matchar resten av din `.md`-fil. Bara att klistra in:

---

## Exercise 1: Grouping Sets

```bash
-- 1.1 Gruppsummering per Territory och OrderYear

SELECT
	name AS Territory,
	YEAR(orderdate) AS OrderYear,
	SUM(freight) AS Freight
FROM
	Sales.SalesTerritory AS st
	INNER JOIN Sales.SalesOrderHeader AS soh
	ON st.TerritoryID = soh.TerritoryID
GROUP BY 
	name,
	YEAR(OrderDate);
```

```bash
-- 1.2 Samma som ovan men med CUBE – summerar också per enskilt fält och totalt

SELECT
	name AS Territory,
	YEAR(orderdate) AS OrderYear,
	SUM(freight) AS Freight
FROM
	Sales.SalesTerritory AS st
	INNER JOIN Sales.SalesOrderHeader AS soh
	ON st.TerritoryID = soh.TerritoryID
GROUP BY CUBE(
	name,
	YEAR(OrderDate)
);
```

```bash
-- 1.3 Anpassade summeringar med GROUPING SETS – totalt, per år och per territory

SELECT
	name AS Territory,
	YEAR(orderdate) AS OrderYear,
	SUM(freight) AS Freight
FROM
	Sales.SalesTerritory AS st
	INNER JOIN Sales.SalesOrderHeader AS soh
	ON st.TerritoryID = soh.TerritoryID
GROUP BY GROUPING SETS (
	(),
	(name),
	(YEAR(OrderDate))
);
```

---

## Exercise 2: Pivoting

```bash
-- Pivottabell: rader = territories, kolumner = år, värden = frakt

SELECT 
	*
FROM (
	SELECT * FROM vw_territory_orders
) AS d
PIVOT(
	SUM(Freight) FOR OrderYear IN ([2011], [2012], [2013], [2014])
) AS pvt;
```

---

Ge mig ett tecken om du vill att jag kör vidare med nästa modul också!
