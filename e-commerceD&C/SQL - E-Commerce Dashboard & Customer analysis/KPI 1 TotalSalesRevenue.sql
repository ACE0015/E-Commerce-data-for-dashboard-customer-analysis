USE AdventureWorks2022

SELECT 
  SUM(TotalDue) AS TotalSalesRevenue
From
  Sales.SalesOrderHeader;