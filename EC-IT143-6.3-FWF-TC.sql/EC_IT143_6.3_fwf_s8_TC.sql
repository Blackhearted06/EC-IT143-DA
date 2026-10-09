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
Next question: How do I extract the LAST name from ContactName?
******************************************************************************************************************/

-- Q: How do I extract the last name from ContactName?
--    Answer: Everything to the RIGHT of the first space.

SELECT CustomerID
     , ContactName
     , RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)) AS LastName
  FROM dbo.t_w3_schools_customers;