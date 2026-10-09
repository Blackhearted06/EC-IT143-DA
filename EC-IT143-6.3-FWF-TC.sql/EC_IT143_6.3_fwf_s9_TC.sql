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
Takes a full contact name (e.g., 'Maria Anders') and returns the last name (e.g., 'Anders').
Handles names with no space by returning the whole string.
******************************************************************************************************************/

DROP FUNCTION IF EXISTS dbo.udf_last_name;
GO

CREATE FUNCTION dbo.udf_last_name (@ContactName VARCHAR(100))
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @LastName VARCHAR(50);
    DECLARE @SpacePos INT;

    SET @SpacePos = CHARINDEX(' ', @ContactName);

    IF @SpacePos = 0
        SET @LastName = @ContactName;   -- no space, return whole string
    ELSE
        SET @LastName = RIGHT(@ContactName, LEN(@ContactName) - @SpacePos);

    RETURN @LastName;
END;
GO

-- Quick test
SELECT dbo.udf_last_name('Maria Anders') AS LastName;