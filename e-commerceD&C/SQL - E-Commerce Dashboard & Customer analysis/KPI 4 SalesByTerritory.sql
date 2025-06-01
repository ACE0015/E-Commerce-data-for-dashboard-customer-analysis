SELECT
  ST.Name AS TerritoryName,
  SUM(SOH.TotalDue) AS RevenueFromTerritory
FROM
  Sales.SalesOrderHeader AS SOH
JOIN
  Sales.SalesTerritory AS ST
  ON SOH.TerritoryID = ST.TerritoryID
GROUP BY
  ST.Name
ORDER BY
  RevenueFromTerritory DESC;
  