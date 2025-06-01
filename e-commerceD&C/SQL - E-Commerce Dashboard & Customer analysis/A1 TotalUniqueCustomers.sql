USE AdventureWorks2022

SELECT
  COUNT(DISTINCT CustomerID) AS TotalUniqueCustomers
FROM
  Sales.SalesOrderHeader;