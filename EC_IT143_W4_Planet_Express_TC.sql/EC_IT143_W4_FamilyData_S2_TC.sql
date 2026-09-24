--Step 1: Start with a question
--Question: Can I get all employees from Engineering Department

--Step 2: Start generating the answer
--Current state i have the question but no query yet.
--The next logical step is to write a simple SELECTstatement.

--step 3: Ad hoc query.
SELECT 
'Senior Engineer'
 AS Engineering
;

--Step 4: Turn the ad hoc into a view
GO
CREATE VIEW v_Engineering AS
SELECT 
'Senior Engineer' AS Engineering;
GO
--Test the query
SELECT * FROM v_Engineering;

--Step 5.1: Create a Table from the view.

SELECT * INTO t_Engineering
FROM v_Engineering;
GO

--Test the query
SELECT * FROM t_Engineering;

--Step 5.2: Refine the Query
DROP TABLE IF EXISTS t_Engineering;
GO
CREATE TABLE t_Engineering (
   Employee_Name varchar(50) NOT NULL,
   Department varchar(50) NOT NULL,
   Age  INT PRIMARY KEY
   );
 GO

 INSERT  INTO t_Engineering (Department)
 SELECT Department FROM t_engineering;
 GO
--Test the query
SELECT *
FROM t_Engineering;

--Step 6: Load the table from the View.
GO
TRUNCATE TABLE t_Relatives
GO
INSERT INTO t_Engineering (Department)
SELECT Department FROM t_Engineering;
GO

--Test the query
SELECT * FROM t_Engineering;

--Step 7: Turn the script into a Stored Procedure.
GO
CREATE OR ALTER PROCEDURE usp_load_Enginerring
AS
BEGIN
 SET NOCOUNT ON;
 TRUNCATE TABLE t_Engineering
 INSERT INTO t_Engineering (Department)
 SELECT Department FROM t_Engineering
 END;
 GO

--Step 8: Call out the Stored Procedures
EXEC usp_load_Engineering;

SELECT * FROM t_Engineering;


SELECT * FROM Employees;