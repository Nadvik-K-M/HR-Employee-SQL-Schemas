select * from employees;

select first_name from employees order by salary fetch  first 3 rows only;

--SELECT DISTINCT salary
--FROM employees
--ORDER BY salary DESC
--FETCH FIRST 3 ROWS ONLY;

SELECT salary
FROM (
  SELECT salary
  FROM employees
  ORDER BY salary DESC
)
WHERE ROWNUM <= 3;

select salary from employees where salary < (select max(salary) from employees) where rownum <=2;

select * from employees;

---in
select max(salary) from employees where salary<(select max(salary) from employees);

select salary 
from 
( 
select salary 
from employees 
order by salary
desc)
where rownum <=6;
