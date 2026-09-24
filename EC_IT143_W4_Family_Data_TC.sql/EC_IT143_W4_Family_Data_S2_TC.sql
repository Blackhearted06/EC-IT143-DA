--Step 1: Start with a question
--Question: Can I get all employees that has a last name of Simpsons

--Step 2: Start generating the answer
--Current state i have the question but no query yet.
--The next logical step is to write a simple SELECTstatement.

--step 3: Ad hoc query.
SELECT 
'Last_Name'
 AS Relatives
;

--Step 4: Turn the ad hoc into a view
GO
CREATE VIEW v_Relatives AS
SELECT 
'Last_Name' AS Relatives;
GO
--Test the query
SELECT * FROM v_Relatives;

--Step 5.1: Create a Table from the view.

SELECT * INTO t_Relatives
FROM v_Relatives;
GO

--Test the query
SELECT * FROM t_Relatives;

--Step 5.2: Refine the Query
DROP TABLE IF EXISTS t_Relatives;
GO
CREATE TABLE t_Relatives (
   First_Name varchar(50) NOT NULL,
   Last_Name varchar(50) NOT NULL,
   Member_ID INT PRIMARY KEY
   );
 GO

 INSERT  INTO t_Relatives (First_Name)
 SELECT First_Name FROM t_Relatives;
 GO
--Test the query
SELECT *
FROM t_Relatives;

--Step 6: Load the table from the View.
GO
TRUNCATE TABLE t_Relatives
GO
INSERT INTO t_Relatives (First_Name)
SELECT First_Name FROM t_Relatives;
GO

--Test the query
SELECT * FROM t_Relatives;

--Step 7: Turn the script into a Stored Procedure.
GO
CREATE OR ALTER PROCEDURE usp_load_Relatives
AS
BEGIN
 SET NOCOUNT ON;
 TRUNCATE TABLE t_Relatives
 INSERT INTO t_Relatives (First_Name)
 SELECT First_Name FROM t_Relatives;
 END;
 GO

--Step 8: Call out the Stored Procedures
EXEC usp_load_Relatives;

SELECT * FROM t_Relatives;
