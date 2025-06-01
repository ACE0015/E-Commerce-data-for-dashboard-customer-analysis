use AdventureWorks2022

SELECT
  P.Name AS ProductName,
  SUM(SOD.LineTotal) AS RevenueFromProduct
FROM
  Sales.SalesOrderDetail AS SOD
JOIN
  Production.Product AS P
  ON SOD.ProductID = P.ProductID
GROUP BY
  P.Name
ORDER BY
  RevenueFromProduct DESC ;