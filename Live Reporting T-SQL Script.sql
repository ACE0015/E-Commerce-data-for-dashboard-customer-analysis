USE AdventureWorks2022;

-- Customer Segmentation using RFM Model for Dashboarding
-- Create a View for direct connection from Power BI or other tools

GO
CREATE OR ALTER VIEW vw_CustomerSegmentation AS
WITH CustomerOrders AS (
    -- Step 1: Get base order data for each customer
    SELECT
        c.CustomerID,
        CONCAT(p.FirstName, ' ', p.LastName) AS FullName,
        soh.OrderDate,
        soh.TotalDue
    FROM Sales.Customer AS c
    JOIN Sales.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
    JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID
),
RFM_Base AS (
    -- Step 2: Calculate raw Recency, Frequency, and Monetary values
    SELECT
        CustomerID,
        FullName,
        DATEDIFF(day, MAX(OrderDate), GETDATE()) AS Recency,
        COUNT(OrderDate) AS Frequency,
        SUM(TotalDue) AS Monetary
    FROM CustomerOrders
    GROUP BY CustomerID, FullName
),
RFM_Scores AS (
    -- Step 3: Score customers from 1-5 using NTILE
    SELECT
        CustomerID,
        FullName,
        Recency,
        Frequency,
        Monetary,
        NTILE(5) OVER (ORDER BY Recency DESC) AS R_Score, -- Lower recency is better, so DESC gives high scores to recent buyers
        NTILE(5) OVER (ORDER BY Frequency ASC) AS F_Score, -- Higher frequency is better
        NTILE(5) OVER (ORDER BY Monetary ASC) AS M_Score   -- Higher monetary is better
    FROM RFM_Base
)
-- Step 4: Combine scores and create segments
SELECT
    s.CustomerID,
    s.FullName,
    s.Recency,
    s.Frequency,
    CAST(s.Monetary AS DECIMAL(18, 2)) AS CustomerLifetimeValue,
    s.R_Score,
    s.F_Score,
    s.M_Score,
    CONCAT(s.R_Score, s.F_Score, s.M_Score) AS RFM_Score,
    -- Define Customer Segments based on RFM scores
    CASE
        WHEN CONCAT(s.R_Score, s.F_Score, s.M_Score) IN ('555', '554', '545', '455', '544') THEN 'Champions'
        WHEN CONCAT(s.R_Score, s.F_Score, s.M_Score) IN ('543', '444', '435', '355', '354') THEN 'Loyal Customers'
        WHEN CONCAT(s.R_Score, s.F_Score, s.M_Score) IN ('553', '551', '552', '541', '542', '533', '532', '531', '452', '451', '442', '441', '432', '431', '423', '353', '352', '351', '342', '341', '333', '323') THEN 'Potential Loyalists'
        WHEN CONCAT(s.R_Score, s.F_Score, s.M_Score) IN ('535', '534', '445', '434', '345', '344', '335') THEN 'Recent Customers'
        WHEN CONCAT(s.R_Score, s.F_Score, s.M_Score) IN ('331', '321', '312', '221', '213') THEN 'Promising'
        WHEN CONCAT(s.R_Score, s.F_Score, s.M_Score) IN ('332', '322', '233', '232', '223', '222', '132', '123', '122', '212') THEN 'Customers Needing Attention'
        WHEN CONCAT(s.R_Score, s.F_Score, s.M_Score) IN ('111', '112', '121', '131', '141', '151') THEN 'Hibernating'
        WHEN CONCAT(s.R_Score, s.F_Score, s.M_Score) IN ('255', '254', '245', '244', '253', '252', '243', '242', '235', '234', '225', '155', '154', '145', '144', '143', '153', '152', '142', '135', '134', '133', '125', '124') THEN 'At Risk'
        ELSE 'Others'
    END AS CustomerSegment
FROM RFM_Scores s;
GO