--Beginner
--List each employee’s first name, last name, and their department name.
--Hint: Use an INNER JOIN of Employees with Departments.
select e.first_name , e.last_name , d.department_name from 
employees e
inner join
departments d
on e.department_id = d.department_id;

--
--Beginner-Intermediate
--List all employees, with their corresponding de
--partment names. For employees who do not belong to a
--ny department (department_id is NULL or no matching department), still include them, but show department name as NULL.
select e.first_name,d.department_name 
from
employees e
left join 
departments d
on e.department_id = d.department_id;
--
--Intermediate
--List all departments and how many employees are in each d
--epartment. Include departments even if zero employees are assigned.
select d.department_name , count(e.first_name) as orderss
from departments d
left join 
 employees e
on d.department_id = e.department_id
group by d.department_name 
order by orderss desc;
--
--Intermediate
--Find all employees who are managers (i.e. someone else has them a
--s manager). Show the manager’s first_name, last_name and the number of direct reports (employees having them as manager)
select e1.first_name emp_name ,e2.first_name mang_name , e2.last_name mng_last_name
from employees e1
join 
employees e2
on e1.employee_id = e2.manager_id;

--
--Intermediate-Advanced
--List department names along with the average salary of employees
--in each department. Exclude departments with no employees (or handle them as you prefer). Order by average salary descending.
select d.department_name , avg(e.salary) as avg_salary
from employees e
inner join 
departments d
on e.department_id = d.department_id
group by d.department_name
order by avg_salary desc;
--
--Advanced
--Find the highest salary in each department, and list the employee
--s who earn that highest salary, along with their department name.
select d.department_name , max(e.salary)
from employees e
inner join
departments d
on e.department_id = d.department_id
group by d.department_name
order by max(e.salary) desc;

--
--Advanced
--For each department, list the department head’s name (from Employees 
--table via head_id) and the total salary of all employees in that department.
select * from employees;
select * from departments;
--
--Advanced
--List all pairs of employees who work in the same department (employee A,
--employee B). Don’t list the same pair twice (e.g. A-B and B-A), and do not pair an employee with themselves.
--
select e1.employee_id,
        e1.first_name,
        e2.first_name ,
        e2.employee_id
    from employees e1
    join employees e2
    on e1.department_id = e2.department_id
    where e1.first_name <> e2.first_name;
    
--Very Advanced
--Suppose you want a list of every employee with every department — that is
--a Cartesian pairing — and then mark whether the employee belongs to that department
--or not, e.g. with a flag column “belongs_to” (yes/no or boolean). (This tests CROSS JOIN plus a conditional)
select e.first_name,e.employee_id , d.department_name, d.department_id,
case 
when 
e.department_id = d.department_id then 'Yes'
else
'No'
end
from employees e
cross join 
departments d
order by e.employee_id;

--
--Very Advanced
--Using Employees and Departments, produce a list of departments that have more than
--one location (if we assume location in Departments) or (if Departments has no multiple 
--rows per dept with different locations you can modify schema) or assume a Locations table 
--joined on Departments. Then for those departments, list employees in them whose salary is 
--above the department’s average salary, along with how much above average they are.
select
  d.department_id,
  d.department_name,
  head.first_name as head_first,
  head.last_name as head_last,
  sum(e.salary) as total_salary
from departments d
left join employees head
  on d.head_id = head.employee_id
left join employees e
  on e.department_id = d.department_id
group by
  d.department_id,
  d.department_name,
  head.first_name,
  head.last_name
order by total_salary desc;

with dept_max as (
  select
    department_id,
    max(salary) as max_salary
  from employees
  group by department_id
)
select
  d.department_name,
  e.employee_id,
  e.first_name,
  e.last_name,
  e.salary
from employees e
join dept_max dm
  on e.department_id = dm.department_id
  and e.salary = dm.max_salary
join departments d
  on d.department_id = e.department_id
order by d.department_name;



















--Window Function Practice Questions
--
--Basic / Introductory
--For each employee, show their salary and the average salary of their department (i.e. compare to their peers).
select first_name , salary ,department_id, avg(salary) over(partition by department_id order by salary)
from employees;

select e.first_name , e.salary ,d.department_name , avg(salary) over(partition by d.department_name order by salary)
from employees e
join departments d
on e.department_id = d.department_id;
--Basic / Ranking
--For each department, rank employees by salary (highest salary = rank 1). 
--Show employee, department, salary, and the rank (use RANK() or DENSE_RANK() or ROW_NUMBER()).
select first_name , department_id , salary , dense_rank()over(partition by department_id order by salary)
from employees;
--
--Intermediate — Top N per group
--Return the top 2 highest paid employees in each department (if fewer than 2 employees exist, still show them).
select first_name ,department_id,max(salary),
--
--Intermediate — Cumulative / Running Total
--For each department, compute a running total of salaries in ascending order of hire_date (or employee_id), i.e. cumulative sum of salaries over time.
--
--Intermediate — Percentile / Distribution
--For the whole company (or partitioned by department), compute for each employee the percentile of their salary among peers (e.g. using PERCENT_RANK() or CUME_DIST()).
--
--Intermediate / Advanced — Window frame specification
--For each employee, compute the average salary of the 2 employees hired immediately before and after (in their department) — i.e. a “moving window” of 2 preceding + 2 following within the same department.
--
--Advanced — Difference from previous
--For each department, list employees with their salary and also the difference between their salary and the previous salary (within that department, ordered by salary). Use LAG().
--
--Advanced — Gap or lead
--For each department, for each employee show also the salary of the next higher-paid employee (within that department), using LEAD().
--
--Advanced — Combining window + filtering
--Find employees whose salary is above the departmental average and also in the top 10% (or top quartile) of the company.
--
--Very Advanced — Running totals with partition and reset
--Suppose you want a running count of employees hired per year, but the counter resets for each department. I.e. for each employee, show how many employees in the same department have been hired so far (in that department), ordered by hire_date.
--
--Very Advanced — Multiple window functions in one query
--Produce a view with columns:
--
--employee_id, first_name, last_name
--
--department_name
--
--salary
--
--average salary in department
--
--rank by salary in department
--
--cumulative salary total in department (as of this employee’s hire_date)
--
--difference from previous salary in department

;


select e.first_name,e.last_name,d.department_name  from employees e
join departments d
on e.department_id = d.department_id
where e.salary = (
select max(salary) from employees);
select first_name, salary from(
select first_name , salary,  row_number() over(order by salary desc ) as rnk from employees)
where rnk = 30;

SELECT first_name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary ASC) AS row_num
FROM
    employees;



select max(salary) from employees where salary< (select max(salary) from employees);

select first_name,salary from 
( select first_name,salary ,row_number() over(order by salary desc)as rnk from employees) 
where rnk =2;

SELECT salary,first_name,department_id
FROM (
    SELECT first_name,department_id,salary, r() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
)
WHERE rnk = 1;

select salary from employees where salary > (select avg(salary) from employees);

select sysdate from dual;

select first_name,department_id,count(*)
from employees
group by first_name,department_id
having count(*) > 1;


select * from employees 
intersect 
select * from departments;



select * from
(select e.* , row_number() over(order by employee_id asc)as rnk from  employees e) 
where rnk between 1 and 10 ;

select * from
( select * from employees order by employee_id desc )
where rownum <=10;

select fullname,salary from (
select first_name ||' '|| last_name as fullname,salary from employees order by  salary desc)
where rownum between 1 and 10;

select * from (
select * from employees order by salary desc)
where rownum <=5;

select sum(salary) from employees;

select * from employees where hire_date like '03%';

SELECT SYS_CONTEXT('USERENV', 'SERVER_HOST') AS db_server_host
FROM DUAL
;

select first_name from employees where upper(first_name) like 'A%A' or upper(first_name) like 'A%T';

select first_name,department_id,manager_id  from employees where  manager_id is null;

select * from employees where manager_id is null;

SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM employees m
    WHERE m.manager_id = e.employee_id
);

select department_id , empcount from
(select department_id , count(*) as empcount
from employees
group by department_id 
order by  count(*) desc)
where rownum = 2;

select department_id ,counts
from(
select department_id,count(*) as counts ,row_number() over(order by count(*) desc) as rnk from employees
group by department_id)
where rnk = 5;















