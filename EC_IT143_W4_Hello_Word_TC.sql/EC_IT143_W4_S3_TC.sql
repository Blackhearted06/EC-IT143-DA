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

SELECT * FROM dbo.v_hello_world;