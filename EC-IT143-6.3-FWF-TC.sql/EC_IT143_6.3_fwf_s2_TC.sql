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
Where I am:  I have a question but no answer yet.
Next step:   Look at the ContactName column to understand its format.
******************************************************************************************************************/

-- Where am I? I need to see how ContactName is formatted.
-- Next step: Query the table to look at actual values.

SELECT TOP 5
       CustomerID
     , ContactName
  FROM dbo.t_w3_schools_customers;