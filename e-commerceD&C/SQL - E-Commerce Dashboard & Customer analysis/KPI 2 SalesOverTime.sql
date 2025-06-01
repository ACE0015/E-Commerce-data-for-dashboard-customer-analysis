USE AdventureWorks2022

SELECT 
  Year(OrderDate) AS SalesYear,
  MONTH(OrderDate) AS SalesMonth,
  SUM(TotalDue) AS MonthlySalesRevenue
FROM
  Sales.SalesOrderHeader
GROUP BY
  Year(OrderDate),
  MONTH(OrderDate)
ORDER BY
  SalesYear,
  SalesMonth;
