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











