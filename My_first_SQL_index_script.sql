/*****************************************************************************************************************
NAME:    EC_IT143_W6.4_PerformanceAnalysis_TC.sql
PURPOSE: Week 6.4 - Performance Analysis
         Demonstrates execution plans, missing index recommendations,
         and index creation on two different AdventureWorks tables.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/12/2026   Travis Chirwa         1.I Built this script for W6.4 Performance Analysis

RUNTIME:
~2s

NOTES:
Two queries on two different tables, each designed to trigger a
missing index recommendation in SQL Server.

IMPORTANT: Before running, We have to turn on "Include Actual Execution Plan"
           in SSMS (Ctrl + M).
******************************************************************************************************************/


-- ============================================================================================================
-- QUERY 1: Person.Address  --We will  filter on City (unindexed character field)
-- ============================================================================================================

-- Step 1: Run this query WITH Actual Execution Plan enabled (Ctrl + M).
-- Step 2: Hover over the SELECT operator and note the Estimated Subtree Cost.
-- Step 3: Look at the green "Missing Index" .
-- Step 4: Right-click the hint -> "Missing Index Details..." to get the CREATE INDEX script.
-- Step 5: Name the index and run it (below).
-- Step 6: Re-run the query and compare runtime / estimated subtree cost.

SELECT AddressID
     , AddressLine1
     , City
     , StateProvinceID
     , PostalCode
  FROM Person.Address
 WHERE City = 'Bothell';
GO


-- Index created from the missing index recommendation (Query 1)
CREATE NONCLUSTERED INDEX IX_Person_Address_City
    ON Person.Address (City)
    INCLUDE (AddressLine1, StateProvinceID, PostalCode);
GO


-- Re-run the query to see performance improvement
SELECT AddressID
     , AddressLine1
     , City
     , StateProvinceID
     , PostalCode
  FROM Person.Address
 WHERE City = 'Bothell';
GO



-- ============================================================================================================
-- QUERY 2: Person.Person  -- filter on FirstName (unindexed character field)
-- ============================================================================================================

-- Same process as Query 1:
--   * Turn on Actual Execution Plan
--   * Note Estimated Subtree Cost
--   * Capture the Missing Index Recommendation
--   * Create the index with a proper name
--   * Re-run and compare

SELECT BusinessEntityID
     , FirstName
     , LastName
     , PersonType
  FROM Person.Person
 WHERE FirstName = 'Kim';
GO


-- Index created from the missing index recommendation (Query 2)
CREATE NONCLUSTERED INDEX IX_Person_Person_FirstName
    ON Person.Person (FirstName)
    INCLUDE (LastName, PersonType);
GO


-- Re-run the query to see performance improvement
SELECT BusinessEntityID
     , FirstName
     , LastName
     , PersonType
  FROM Person.Person
 WHERE FirstName = 'Kim';
GO