/*****************************************************************************************************************
NAME:    EC_IT143_W5_PlanetExpress_Answers_tc.sql
PURPOSE: Answer four community questions using T-SQL for the Planet_Express data set.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/02/2025   Travis Chirwa 1. Built this script for EC IT143 W5 assignment.

RUNTIME:
Xm Xs

NOTES:
Answers four questions from stakeholders about the Planet_Express community data set.
Each question's original author is credited above the query.
Queries use the flat table dbo.Planet_Express directly.

******************************************************************************************************************/


-- =====================================================================
-- Q1: Which card members have the highest total transaction amounts?
-- Author: Travis Chirwa 
-- =====================================================================
-- A1: Sum the Amount column grouped by card member.

SELECT TOP 5
    [Card_Member]  AS card_member,
    SUM(Amount)  AS total_spent,
    COUNT(*)   AS transaction_count
FROM dbo.Planet_Express
GROUP BY [Card_Member]
ORDER BY total_spent DESC;
GO

SELECT * FROM Planet_Express;

-- =====================================================================
-- Q2: What are the top spending categories by total transaction amount?
-- Author: Colleague 
-- =====================================================================
-- A2: Sum Amount grouped by category.

SELECT TOP 20
    Category        AS category_name,
    SUM(Amount)     AS total_amount,
    COUNT(*)        AS transaction_count
FROM dbo.Planet_Express
WHERE Category IS NOT NULL AND Category <> ''
GROUP BY Category
ORDER BY total_amount DESC;
GO


-- =====================================================================
-- Q3: How many transactions did each card member make?
-- Author: Colleague
-- =====================================================================
-- A3: Count transactions grouped by card member.

SELECT
    [Card_Member] AS card_member,
    COUNT(*)  AS transaction_count
FROM dbo.Planet_Express
GROUP BY [Card_Member]
ORDER BY transaction_count DESC;
GO


-- =====================================================================
-- Q4: Which card member has the highest average transaction amount?
-- Author: Travis Chirwa 
-- =====================================================================
-- A4: Compute AVG(Amount) grouped by card member.

SELECT TOP 10
    [Card_Member] AS card_member,
    AVG(Amount)  AS avg_transaction,
    COUNT(*) AS num_transactions
FROM dbo.Planet_Express
GROUP BY [Card_Member]
ORDER BY avg_transaction DESC;
GO