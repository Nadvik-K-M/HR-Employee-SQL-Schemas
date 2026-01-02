--List all employees.
select * from employees;
--
--List employee name and salary of all employees.
select first_name, salary from employees;
--
--List all departments.
select * from departments;
--
--Show the job titles in the Jobs table.
select job_title from jobs;

--
--List employees whose salary is more than 50,000.
select first_name from employees where salary > 10000;
--
--List employees who work in department ‘Sales’.
select e.first_name , d.department_name
from employees e
inner join 
departments d
on e.department_id = d.department_id
where d.department_name = 'Sales';

--
--List employees hired after 1-Jan-2020.
select * from employees where hire_date = '17-06-03';
--
--Find the employee(s) with the minimum salary.
select min(salary) from employees;
--
--Find the employee(s) with the maximum salary.
select max(salary) from employees;
--
--Count how many employees are in each department.
select d.department_name,count(e.first_name) as emp_count
from employees e
inner join  departments d
on e.department_id = d.department_id
group by d.department_name order by emp_count desc;
--
--Show each department with the average salary of its employees.
select d.department_name , round(avg(e.salary),0)
from employees e
inner join 
departments d
on e.department_id = d.department_id
group by d.department_name;
--
--Show employee name together with their department name (join Employee & Departments).
select e.first_name,d.department_name
from employees e
inner join 
departments d
on e.employee_id = d.department_id;
--
--List employees who do not have a manager (manager_id is NULL).
select first_name,manager_id from employees where manager_id is null;
--
--List employees whose job title is “Analyst” (join with Jobs table).
select e.first_name ,j.job_title from
employees e
inner join
jobs j
on e.job_id = j.job_id
where j.job_title = 'President';


--
--List job_titles and how many employees have that job.
select j.job_title , count(e.first_name)
from jobs j
inner join 
employees e
on j.job_id = e.job_id
group by j.job_title;
--
--Sort employees by salary descending.

select salary from employees order by salary desc;
--
--Sort employees by hire_date ascending.
select first_name, hire_date  from employees order by hire_date;
--
--Find employees whose name starts with ‘A’.
select first_name from employees where first_name like 'A%';
--
--Find employees whose salary is between 40,000 and 80,000.
select first_name from employees where salary between 40000 and 80000;














--Find the second highest salary across all employees.
select max(salary) from employees where salary < (select max(salary) from employees);
--
--For each department, find the employee with the highest salary.
select d.department_name , max(e.salary)
from departments d
inner join
employees e
on d.department_id = e.department_id
group by d.department_name;

--
--List employees who earn more than the average salary of their department.

select d.department_name , e.salary 
from employees e
inner join 
departments d
on e.department_id = d.department_id
group by d.department_name,e.salary 
having salary >(
select avg(salary) from employees);

--
--Find jobs for which no employees are assigned.
select j.job_title from jobs j
left join 
employees e
on j.job_id = e.job_id
where j.job_id is null;


--
--For each job, show job title and how many employees are in that job, but only jobs having more than 5 employees.
select j.job_title , count(e.first_name) 
from jobs j
inner join 
employees e
on j.job_id = e.job_id
group by j.job_title
having count(e.first_name)>5;


--
--Find departments where the sum of salaries is above a threshold, e.g. > 1,000,000.
select d.department_name , sum(e.salary)
from employees  e
inner join 
departments d
on e.department_id = d.department_id
group by d.department_name
having sum(e.salary) > 100000 ;

--
--Find employees whose salary is greater than their manager’s salary.
select e1.first_name,e2.salary,e2.first_name,e2.salary
from employees e1
join employees e2
on e1.employee_id = e2.manager_id
where e1.salary > e2.salary and e1.salary != e2.salary;
--
--For each department, find the difference between the highest and lowest salary.
select d.department_name , max(salary),min(salary)
from employees  e
inner join departments d
on e.department_id = d.department_id
group by d.department_name
order  by max(salary);
--
--List employees along with the job_title, department_name, and their salary, sorted by department then salary.
select e.first_name,j.job_title,d.department_name,e.salary
from employees e
inner join jobs j
on
e.job_id = j.job_id
inner join departments d
on e.department_id  = d.department_id
order by e.salary;
--
--Find all employees who joined in the same month (any year) as the employee with employee_id = X.
select * from employees where extract(month from hire_date) = '03';

SELECT *
FROM employees
WHERE EXTRACT(Day FROM hire_date) =21;

SELECT *
FROM employees
WHERE EXTRACT(Month FROM hire_date) =01;

SELECT *
FROM employees
WHERE EXTRACT(Year FROM hire_date) =2005;
--
--Use a subquery to list departments where the average salary is more than the company’s overall average salary.
--
--List job titles where the maximum salary allowed (from Jobs table) is less than the maximum salary any employee is getting in that job (i.e. someone is paid more than their job’s max_salary).
--
--Count how many employees are under each manager (manager_id).
--
--Find the top 3 highest paid employees in each department.
--
--Show departments where more than 10 employees have salary above a given value (say 70,000).
--
--Find job titles sorted by the difference between their max_salary and min_salary (from Jobs table) descending.
--
--List employees with no job assignment (job_id is NULL or doesn’t exist in Jobs table).
--
--Find the cumulative salary in each department ordered by hire_date (running total).
--
--For each department, show how salary has changed over years: year, department, sum of salaries for that year.
--
--Identify duplicate employee names in the Employee table.








--Imp
--Get the top 5 highest paid employees.
select salary from (
select salary from employees order by salary desc)
where rownum <= 5 ;