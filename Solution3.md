Såklart Robert – här kommer hela övningen med **kodblock inramade med `bash`**, redo att klistras in i din `.md`-fil på GitHub. Jag har också lagt till små beskrivningar för tydlighet:

---

## Exercise 1: Aggregate Windowing Functions

```bash
-- 1.1 Skapa en vy med summerad frakt per territory och år

CREATE VIEW vw_territory_orders AS
SELECT
	name AS Territory,
	YEAR(orderdate) AS OrderYear,
	CAST(SUM(freight) AS INT) AS Freight
FROM
	Sales.SalesTerritory AS st
	INNER JOIN Sales.SalesOrderHeader AS soh
	ON st.TerritoryID = soh.TerritoryID
GROUP BY
	name,
	YEAR(OrderDate);
GO
```

```bash
-- 1.2 Total frakt (alla rader)

SELECT
	*,
	SUM(Freight) OVER() AS SumTotal
FROM
	vw_territory_orders;
```

```bash
-- 1.3 Fraktsumma per territory

SELECT
	*,
	SUM(Freight) OVER(PARTITION BY Territory) AS FreightPerTerritory
FROM
	vw_territory_orders;
```

```bash
-- 1.4 Fraktsumma per år

SELECT
	*,
	SUM(Freight) OVER(PARTITION BY OrderYear) AS FreightPerYear
FROM
	vw_territory_orders;
```

```bash
-- 1.5 Ackumulerad frakt per territory (year-to-date)

SELECT
	*,
	SUM(Freight) OVER(PARTITION BY Territory ORDER BY OrderYear) AS FreightYTD
FROM
	vw_territory_orders;
```

```bash
-- 1.6 Samma som 1.5 men med uttryckligt "ROWS BETWEEN"

SELECT
	*,
	SUM(Freight) OVER (
		PARTITION BY Territory
		ORDER BY OrderYear
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	) AS FreightYTD
FROM
	vw_territory_orders;
```

---

## Exercise 2: Ranking Functions

```bash
-- 2.1 Produkter med löpnummer efter namn

SELECT
	name AS ProductName,
	ROW_NUMBER() OVER(ORDER BY name) AS RowNumber
FROM
	Production.Product;
```

```bash
-- 2.2 Rangordning av produkter efter pris

SELECT
	name AS ProductName,
	ListPrice,
	RANK() OVER(ORDER BY ListPrice DESC) AS PriceRank
FROM
	Production.Product;
```

```bash
-- 2.3 Dela upp produkter i tre nivåer baserat på pris (NTILE)

SELECT
	name AS ProductName,
	ListPrice,
	NTILE(3) OVER(ORDER BY ListPrice DESC) AS PriceRank
FROM
	Production.Product;
```

---

## Exercise 3: Offset Functions

```bash
-- 3.1 Frakten från föregående år

SELECT
	*,
	LAG(Freight, 1, NULL) OVER (PARTITION BY Territory ORDER BY OrderYear) AS FreightLastYear
FROM
	vw_territory_orders;
```

```bash
-- 3.2 Skillnad jämfört med föregående år

SELECT
	*,
	LAG(Freight, 1, NULL) OVER (PARTITION BY Territory ORDER BY OrderYear) AS FreightLastYear,
	Freight - LAG(Freight, 1, NULL) OVER (PARTITION BY Territory ORDER BY OrderYear) AS Difference
FROM
	vw_territory_orders;
```

```bash
-- 3.3 Procentuell skillnad mot föregående år (med CTE)

WITH cte AS (
	SELECT
		*,
		LAG(Freight, 1, NULL) OVER (PARTITION BY Territory ORDER BY OrderYear) AS FreightLastYear,
		Freight - LAG(Freight, 1, NULL) OVER (PARTITION BY Territory ORDER BY OrderYear) AS Difference
	FROM
		vw_territory_orders
)
SELECT
	*,
	Difference * 100.0 / FreightLastYear AS DiffProc
FROM
	cte;
```

---

Vill du ha nästa modul också? Bara säg till – jag har momentumen nu 😄
