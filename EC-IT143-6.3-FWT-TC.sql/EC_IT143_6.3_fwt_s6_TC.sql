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

-- Next question: How do I set "last modified by" to the SERVER user instead of
-- relying on the application to send it?
--
-- Answer: Use SUSER_NAME() inside the trigger (already done).
--         SUSER_NAME() returns the login name of the current connection.
--
-- Bonus question: What about INSERTs? Should new rows also get a timestamp?
-- Answer: Add a DEFAULT constraint on last_modified_date and last_modified_by
--         so brand-new rows get seeded automatically.

ALTER TABLE dbo.t_w3_schools_customers
    ADD CONSTRAINT df_t_w3_last_modified_date DEFAULT (GETDATE()) FOR last_modified_date;
GO

ALTER TABLE dbo.t_w3_schools_customers
    ADD CONSTRAINT df_t_w3_last_modified_by DEFAULT (SUSER_NAME()) FOR last_modified_by;
GO