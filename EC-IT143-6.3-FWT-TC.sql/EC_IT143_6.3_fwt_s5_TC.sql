/*****************************************************************************************************************
NAME:    EC_IT143_6.3_fwt_s1_xx.sql
PURPOSE: Step 1 - Start with a question (Last Modified tracking)

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/08/2026   Travis Chirwa     1. Built this script for EC_IT143_6.3_fwt_s1_TC.sql

RUNTIME:
1s
******************************************************************************************************************/

-- Before: check the current state of customer 1
SELECT CustomerID, CustomerName, ContactName, last_modified_date, last_modified_by
  FROM dbo.t_w3_schools_customers
 WHERE CustomerID = 1;

-- Perform an update
UPDATE dbo.t_w3_schools_customers
   SET ContactName = ContactName   -- harmless change to fire the trigger
 WHERE CustomerID = 1;

-- After: confirm the trigger fired
SELECT CustomerID, CustomerName, ContactName, last_modified_date, last_modified_by
  FROM dbo.t_w3_schools_customers
 WHERE CustomerID = 1;