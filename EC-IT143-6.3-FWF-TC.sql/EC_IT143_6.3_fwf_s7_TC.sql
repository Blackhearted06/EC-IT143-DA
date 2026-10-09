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
If the UDF is working correctly, this query returns ZERO rows.
******************************************************************************************************************/

WITH cte_compare AS
(
    SELECT LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHocFirstName
         , dbo.udf_first_name(ContactName)                            AS UdfFirstName
      FROM dbo.t_w3_schools_customers
)
SELECT *
  FROM cte_compare
 WHERE AdHocFirstName <> UdfFirstName
    OR (AdHocFirstName IS NULL AND UdfFirstName IS NOT NULL)
    OR (AdHocFirstName IS NOT NULL AND UdfFirstName IS NULL);