/*****************************************************************************************************************
NAME:    EC_IT143_6.3_fwf_s2_TC.sql
PURPOSE: Step 2 - Begin creating an answer (First Name)

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/08/2026   xx            1. Built this script for EC_IT143_6.3_fwf_s2_TC.sql

RUNTIME:
1s

NOTES:
Research source: https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql
                 https://learn.microsoft.com/en-us/sql/t-sql/functions/left-transact-sql

Testing edge cases:
- A name with only one word (e.g., 'Zbyszek') has no space.
- The '+ '' '' trick appends a space so CHARINDEX never returns 0.
******************************************************************************************************************/

-- Test edge case: name with no space
SELECT LEFT('Zbyszek', CHARINDEX(' ', 'Zbyszek' + ' ') - 1) AS FirstName;

-- Test the full table
SELECT CustomerID
     , ContactName
     , LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
  FROM dbo.t_w3_schools_customers;
