USE AdventureWorks2022

SELECT TOP 10
  C.CustomerID,
  P.FirstName,
  P.LastName,
  SUM(SOH.TotalDue) AS TotalSpentByCustomer
FROM
  Sales.SalesOrderHeader AS SOH
JOIN
  Sales.Customer AS C
  ON SOH.CustomerID = C.CustomerID
JOIN
  Person.Person AS P
  ON C.PersonID = P.BusinessEntityID
WHERE
  C.PersonID IS NOT NULL
GROUP BY
  C.CustomerID, P.FirstName, P.LastName
ORDER BY
  TotalSpentByCustomer;
  