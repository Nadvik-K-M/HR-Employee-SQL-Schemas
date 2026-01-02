--SELECT FIRST_NAME,HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE = TO_DATE('2002-06-07','YYYY-MM-DD');\
--
--SELECT * FROM EMPLOYEES;
--
--
--
--
--? SQL Date Filtering Exercises
--
--Employees Hired After a Specific Date
--Retrieve the details of employees who were hired after January 1, 2020.
SELECT * FROM EMPLOYEES WHERE HIRE_DATE > TO_DATE('01-01-2020','MM-DD-YYYY') ORDER BY HIRE_DATE;

--
--Employees Hired Before a Specific Date
--List all employees who were hired before June 15, 2015.
SELECT * FROM EMPLOYEES WHERE HIRE_DATE < TO_DATE('15-06-2015','DD-MM-YYYY');
--
--Employees Hired Within a Date Range
--Find employees hired between March 1, 2018, and December 31, 2019.
SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN TO_DATE('01-03-2018','DD-MM-YYYY') AND TO_DATE('31-12-2019','DD-MM-YYYY');
--
--Employees Hired on a Specific Day of the Week
--Retrieve employees who were hired on a Monday.
SELECT FIRST_NAME,HIRE_DATE FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'D') = 2;

--Employees Hired in the Last 30 Days
--Show employees who were hired in the last 30 days from the current date.
SELECT *
FROM employees
WHERE hire_date >= SYSDATE - INTERVAL '30' DAY;

--Employees Hired in the Last N Months
--List employees hired in the last N months, where N is a variable.

--
--Employees Hired in a Specific Month and Year
--Find employees hired in March 2022.
--
--Employees Hired in the Last Quarter
--Retrieve employees who were hired in the last quarter.
--
--Employees Hired in the Current Year
--List employees hired in the current year.
--
--Employees Hired in the Previous Year
--Show employees who were hired in the previous year.
--
--Employees Hired in the First Half of the Year
--Find employees hired between January 1 and June 30.
--
--Employees Hired in the Second Half of the Year
--List employees hired between July 1 and December 31.
--
--Employees Hired on a Specific Date
--Retrieve employees who were hired on February 14, 2023.
--
--Employees Hired in the Last Week
--Show employees who were hired in the last 7 days.
--
--Employees Hired in the Last 90 Days
--Find employees hired in the last 90 days.
--
--Employees Hired in the Last 180 Days
--List employees hired in the last 180 days.
--
--Employees Hired in the Last 365 Days
--Retrieve employees hired in the last 365 days.
--
--Employees Hired in a Specific Week of the Year
--Find employees hired in the 10th week of the year.
--
--Employees Hired in a Specific Fiscal Year
--List employees hired in the fiscal year 2022-2023.
--
--Employees Hired in a Specific Calendar Quarter
--Retrieve employees hired in the first quarter of the year.
