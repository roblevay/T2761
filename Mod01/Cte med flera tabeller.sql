USE AdventureWorks
;WITH cte1 AS
(
SELECT * FROM Sales.Customer
)
,cte2 AS
(
SELECT * FROM Sales.SalesOrderHeader
)
SELECT
	*
FROM	
cte1 INNER JOIN cte2 ON cte1.CustomerID=cte2.CustomerID;