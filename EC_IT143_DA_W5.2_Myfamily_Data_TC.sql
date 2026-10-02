/*****************************************************************************************************************
NAME:    EC_IT143_W5_MyFamily_Answers_tc.sql
PURPOSE: Answer four community questions using T-SQL for the HR Analytics data set.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/02/2025   Travis Chirwa 1. Built this script for EC IT143 W5 assignment.

RUNTIME:
Xm Xs

NOTES:
Answers four questions from stakeholders about the HR Analytics community data set.
Each question's original author is credited above the query.
Queries use the flat table dbo.Employees_raw_Data directly.

******************************************************************************************************************/


-- =====================================================================
-- Q1: How does average salary differ between departments?
-- Author: Head of HR colleague — question sheet 
-- =====================================================================
-- A1: Group employees by department and compute AVG(salary).

SELECT
    department,
    AVG(salary) AS avg_salary,
    COUNT(*)    AS employee_count
FROM dbo.[Employees_raw_Data.csv]
WHERE salary IS NOT NULL
  AND department IS NOT NULL
  AND department <> ''
GROUP BY department
ORDER BY avg_salary DESC;
GO


-- =====================================================================
-- Q2: Which cities have the highest concentration of top performers
--     (rating 4–5)?
-- Author: Operations Team (colleague — question sheet Q2)
-- =====================================================================
-- A2: Filter for ratings 4 and 5, group by city, and count.

SELECT
    city,
    COUNT(*) AS top_performer_count
FROM dbo.[Employees_raw_Data.csv]
WHERE performance_rating IN (4, 5)
  AND city IS NOT NULL
GROUP BY city
ORDER BY top_performer_count DESC;
GO


-- =====================================================================
-- Q3: Are employees who work remotely paid differently from those
--     who do not?
-- Author: Compensation Analyst (colleague — question sheet Q3)
-- =====================================================================
-- A3: Group by remote_work status and compare average salary.

SELECT
    UPPER(remote_work) AS remote_status,
    AVG(salary)        AS avg_salary,
    COUNT(*)           AS employee_count
FROM dbo.[Employees_raw_Data.csv]
WHERE salary IS NOT NULL
  AND remote_work IS NOT NULL
  AND remote_work <> ''
  AND remote_work <> 'nan'
GROUP BY UPPER(remote_work)
ORDER BY avg_salary DESC;
GO


-- =====================================================================
-- Q4: Are performance ratings consistent across departments?
-- Author: Performance Review Board (colleague — question sheet Q4)
-- =====================================================================
-- A4: Count each performance rating per department.

SELECT
    department,
    performance_rating,
    COUNT(*) AS rating_count
FROM dbo.[Employees_raw_Data.csv]
WHERE performance_rating IS NOT NULL
  AND department IS NOT NULL
GROUP BY department, performance_rating
ORDER BY department, performance_rating;
GO