/*****************************************************************************************************************
NAME:    EC_IT143_6.3_fwt_s1_TC.sql
PURPOSE: Step 1 - Start with a question (Last Modified tracking)

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/08/2026   Travis Chirwa     1. Built this script for EC_IT143_6.3_fwt_s1_TC.sql

RUNTIME:
1s

NOTES:
Research:
- CREATE TRIGGER:  https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql
- SUSER_NAME():    https://learn.microsoft.com/en-us/sql/t-sql/functions/suser-name-transact-sql
- GETDATE():       https://learn.microsoft.com/en-us/sql/t-sql/functions/getdate-transact-sql

Key concept:
- A DEFAULT constraint only fires on INSERT, not on UPDATE.
- Therefore we MUST use an AFTER UPDATE trigger to capture the modifier info.
******************************************************************************************************************/

-- Confirm the columns exist
SELECT  TOP 1 *
FROM dbo.t_w3_schools_customers;