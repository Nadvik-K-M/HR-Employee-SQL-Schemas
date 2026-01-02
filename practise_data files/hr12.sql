-- Important
-- Concatination
select first_name ||' '|| last_name from employees;

select concat(first_name,' ',last_name) from employees;

select * from employees;

select count(employee_id) from employees where hire_date like '%03';
-- Another way
select count(*) from employees
where to_char(hire_date,'YY') = '03';

select * from employees;

select first_name,last_name,salary
from employees 
where 
salary = (select max(salary) from employees);

select first_name,salry from employees
where salary = (select max(salary) from employees);

select first_name,last_name,salary from employees where salary =
(select max(salary) from employees where salary<(select max(salary) from employees where salary <(select
max(salary) from employees)));


select patient_id,first_name from patients where 
first_name like 'S____%S';

select * from employees;

select
(select count(*) from employees where department_id = 80),
(select count(*) from employees where department_id = 90)
from employees;

-- Imortant one 
SELECT
  SUM(CASE WHEN department_id = 90 THEN 1 ELSE 0 END) AS dept_90_count,
  SUM(CASE WHEN department_id = 80 THEN 1 ELSE 0 END) AS dept_80_count
FROM employees;

select 
sum (case when department_id = 70 then 1 else 0 end) as dept,
sum(case when department_id = 60 then 1 else 0 end) as dept
from employees;





