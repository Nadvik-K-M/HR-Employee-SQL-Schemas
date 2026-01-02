select salary from employees 
where salary = (select max(salary) from employees);

 select first_name,salary from employees where salary = (select max(salary) from employees where salary
< (select  max(salary) from employees));

select first_name , salary 
from 
(
select first_name ,salary , rank() over(order by salary desc) rn from employees)
where rn in 2;

select first_name,department_id from employees where first_name = 'John';

--Write a SQL query to find all employees who work in the same department as 'John' using a subquery.
select first_name , department_id from employees where department_id in (select department_id from employees where first_name ='John');

select salary from employees where salary > (select avg(salary) from employees);

select first_name ,department_id from employees 
where department_id in 
(
select department_id from employees where first_name = 'John');

select sum(salary) from employees where department_id in
(select department_id from employees where first_name ='Mary');

select d.department_name, sum(e.salary)
from employees e
join departments d
on e.department_id = d.department_id
where e.department_id in (select department_id from employees where first_name = 'John')
group by d.department_name; 

--select e.first_name from 
--employees e
--join 
--departments d
--on e.department_id = d.department_id
--where e.salary > (select max(salary) from 
-- select department_name from departments where department_name = 'Sales

select first_name,salary
from employees where salary > all
(
select salary
from employees e
join departments d
on e.department_id = d.department_id
where d.department_name = 'Sales');

--rite a SQL query to find departments that have no employees using a subquery.

select department_name from 
departments where department_id not in
(
select distinct department_id from employees
where department_id is null); 

--Find employees who earn more than the average salary of their department without using a JOIN.

select first_name ,salary from employees ;


select department_name
from departments where department_id =
(select department_id from employees where salary  > (select avg(salary) from employees));

select salary from employees  e1
where 2=(
select count(distinct salary) from employees e2
where e2.salary > e1.salary);

select salary from employees e1
where 4=(
select count(salary) from employees e2
where e2.salary > e1.salary);

-Find employees who have been with the company for more than 10 years and earn more than ?70,000.

--
--List employees who have a salary greater than the average salary of their department and have been with the company for more than 2 years.
--
--Find employees who earn more than the average salary in their department and have a commission greater than ?2,000.
--
--List employees who have been with the company for more than 5 years and have a commission greater than ?3,000.
--
--Find employees who have a salary greater than ?60,000 and have been with the company for more than 5 years.
--
--List employees who have a commission but no salary and have been with the company for more than 3 years.







