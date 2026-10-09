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
Takes a full contact name (e.g., 'Maria Anders') and returns the first name (e.g., 'Maria').
******************************************************************************************************************/

DROP FUNCTION IF EXISTS dbo.udf_first_name;
GO

CREATE FUNCTION dbo.udf_first_name (@ContactName VARCHAR(100))
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @FirstName VARCHAR(50);

    -- Everything to the left of the first space.
    -- Appending a space guarantees CHARINDEX returns a value > 0.
    SET @FirstName = LEFT(@ContactName, CHARINDEX(' ', @ContactName + ' ') - 1);

    RETURN @FirstName;
END;
GO

-- Quick test
SELECT dbo.udf_first_name('Maria Anders') AS FirstName;