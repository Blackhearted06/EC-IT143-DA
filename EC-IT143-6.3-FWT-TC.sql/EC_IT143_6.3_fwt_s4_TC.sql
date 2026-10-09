/*****************************************************************************************************************
NAME:    EC_IT143_6.3_fwt_s1_xx.sql
PURPOSE: Step 1 - Start with a question (Last Modified tracking)

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/08/2026   Travis Chirwa     1. Built this script for EC_IT143_6.3_fwt_s1_TC.sql

NOTES:
Fires only for UPDATE statements on dbo.t_w3_schools_customers.
Captures the server user (SUSER_NAME()) and current date/time (GETDATE()).
******************************************************************************************************************/

DROP TRIGGER IF EXISTS dbo.trg_t_w3_schools_customers_after_update;
GO

CREATE TRIGGER dbo.trg_t_w3_schools_customers_after_update
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
       SET c.last_modified_date = GETDATE()
         , c.last_modified_by   = SUSER_NAME()
      FROM dbo.t_w3_schools_customers AS c
     INNER JOIN inserted AS i
        ON c.CustomerID = i.CustomerID;
END;
GO
