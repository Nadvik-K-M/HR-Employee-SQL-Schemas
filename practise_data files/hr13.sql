select e.first_name,e.employee_id,e.department_id,e.salary, d.department_name
from employees e
join departments d
on e.department_id = d.department_id
where e.department_id = 90;

select distinct e1.salary from employees e1
where 2 = (select count(distinct e2.salary) from employees e2 where e2.salary>e1.salary);