--step 1: Starting with a question.
---Question: Can I produce the text "Hellow world" using T-sql?

--Step 2: Begin creating an answer.
--Current state: I have a question but no query yet.
--Next logical step: Write a simple SELECT statement that returns the text.


--Step 3: Ad hoc SQL query.
SELECT 'Hello World' As Greeting;

--Step 4: Turn the ad hoc query into aview.
GO

CREATE VIEW dbo.v_hello_world AS
SELECT 'Hello World' AS Greeting;
GO

--Test query
SELECT * FROM dbo.v_hello_world;

--Step 5.1: Create a table from the view.

SELECT * INTO DBO.t_hello_world
FROM dbo.v_hello_world; 
GO
 
--Test query
SELECT * FROM dbo.t_hello_world;