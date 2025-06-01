USE AdventureWorks2022;

WITH CustomerOrderCounts AS (
  SELECT
    CustomerID,
    COUNT(SalesOrderID) AS NumberOfOrders
  FROM
    Sales.SalesOrderHeader
  GROUP BY
    CustomerID
)
SELECT
  AVG(CAST(NumberOfOrders AS DECIMAL (10,2))) AS AverageOrderPerCustomer
FROM
  CustomerOrderCounts;