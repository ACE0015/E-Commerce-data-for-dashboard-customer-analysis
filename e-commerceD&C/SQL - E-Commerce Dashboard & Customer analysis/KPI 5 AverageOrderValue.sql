USE AdventureWorks2022

SELECT
  AVG(TotalDue) AS AverageOrderValue
FROM
  Sales.SalesOrderHeader;