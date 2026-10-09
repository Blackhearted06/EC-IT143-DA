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
Side-by-side comparison of the UDF and the ad hoc query.
******************************************************************************************************************/

SELECT CustomerID
     , ContactName
     , LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHocFirstName
     , dbo.udf_first_name(ContactName)                            AS UdfFirstName
  FROM dbo.t_w3_schools_customers;