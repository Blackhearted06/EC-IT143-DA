/*****************************************************************************************************************
NAME:    EC_IT143_6.3_fwt_s1_TC.sql
PURPOSE: Step 1 - Start with a question (Last Modified tracking)

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/08/2026   Travis Chirwa     1. Built this script for EC_IT143_6.3_fwt_s1_TC.sql

RUNTIME:
1s
******************************************************************************************************************/

-- Where am I?  I know I need to remember timestamp + user for every UPDATE.
-- Next step:    Add two columns to the table to hold that info.

ALTER TABLE dbo.t_w3_schools_customers
    ADD last_modified_date DATETIME NULL;
GO

ALTER TABLE dbo.t_w3_schools_customers
    ADD last_modified_by VARCHAR(100) NULL;
GO