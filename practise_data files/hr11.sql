select * from employees;

--select first_name,salary from employees 
--  order by salary  desc limit 1; 
  
  select salary from (
  select first_name,salary from employees order by salary desc)
  where rownum <= 2;
  
select max(salary) from employees 
where salary < (select max(salary) from employees where salary <(select max(salary) from employees));




select salary from(
select first_name,salary from employees order by salary desc)
where rownum <=3;

select first_name,salary from employees
where salary = (select max(salary) from employees where salary < 
(select max(salary) from employees where salary < ));

select salary,count(employee_id)
from employees
group by salary
having count(salary)>1;

select department_id ,max(salary)
from employees
group by department_id;




select first_name,salary  from employees
where salary = (select max(salary) from employees);

select count(*) from employees;


select count(distinct 2) from employees;

select 1 from employees;

select 1;

--duplicate
select first_name,count(*)from employees
group by first_name
having count(*) >1;

select first_name from employees where first_name = 'David';







select * from employees;
select first_name,salary ,dense_rank() over(order by salary desc)as rank from employees;

select first_name,count(first_name) from employees 
group by first_name
having count(first_name) > 1;

select * from employees;

select manager_id,department_id,count(*)
from employees
group by manager_id,department_id
having count(*)>1 and count(*)<6
order by count(*);





