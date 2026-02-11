-- 2. Customer Behavior & Retention Analysis Project --

CREATE DATABASE hr_project;

USE hr_project;

SELECT * FROM hr_data;

SELECT COUNT(*) AS Total_rows FROM hr_data;


-- Total Employees -- 
SELECT COUNT(*) AS total_employees
FROM hr_data;

-- Attrition count --
SELECT Attrition, COUNT(*) AS employee_count
FROM hr_data
GROUP BY Attrition;

-- Attrition rate % --
SELECT 
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate_percent
FROM hr_data;


-- Department wise attrition --
-- Findout: Which department has the most employees taking leave? --

SELECT 
Department,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM hr_data
GROUP BY Department;


-- Attrition rate by department --
-- Findout: Which department has the highest number of employees leaving their jobs (in percentage terms)? --

SELECT 
Department,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate_percent
FROM hr_data
GROUP BY Department
ORDER BY attrition_rate_percent DESC;


-- Job Role wise attrition --
-- Findout: Which positions are seeing the most employees quitting? --

SELECT 
JobRole,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate_percent
FROM hr_data
GROUP BY JobRole
ORDER BY attrition_rate_percent DESC;


-- Salary vs Attrition --
-- Check: Are lower-paid people taking more holidays? --

SELECT 
CASE 
    WHEN MonthlyIncome < 3000 THEN 'Low Salary'
    WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Salary'
    ELSE 'High Salary'
END AS salary_group,

COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate_percent

FROM hr_data
GROUP BY salary_group
ORDER BY attrition_rate_percent DESC;


-- Overtime vs Attrition --
-- Check: Are overtime workers taking more leave? --

SELECT 
OverTime,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate_percent
FROM hr_data
GROUP BY OverTime
ORDER BY attrition_rate_percent DESC;


-- Job Satisfaction vs Attrition --
-- Check: Are people with low satisfaction leaving their jobs? --

SELECT 
JobSatisfaction,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate_percent
FROM hr_data
GROUP BY JobSatisfaction
ORDER BY attrition_rate_percent DESC;


-- Age group vs attrition --
-- Check: Are young workers taking leave? --

SELECT 
CASE 
    WHEN Age < 25 THEN '18-25'
    WHEN Age BETWEEN 25 AND 35 THEN '25-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    ELSE '45+'
END AS age_group,

COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate_percent

FROM hr_data
GROUP BY age_group
ORDER BY attrition_rate_percent DESC;


-- Years at company vs attrition --
-- Check: Will new employees leave? --

SELECT 
CASE 
    WHEN YearsAtCompany < 2 THEN '0-2 years'
    WHEN YearsAtCompany BETWEEN 2 AND 5 THEN '2-5 years'
    WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '5-10 years'
    ELSE '10+ years'
END AS experience_group,

COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate_percent

FROM hr_data
GROUP BY experience_group
ORDER BY attrition_rate_percent DESC;


-- Work life balance vs attrition --
-- Check: They have a poor work-life balance. Are they leaving the company? --

SELECT 
WorkLifeBalance,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate_percent
FROM hr_data
GROUP BY WorkLifeBalance
ORDER BY attrition_rate_percent DESC;


