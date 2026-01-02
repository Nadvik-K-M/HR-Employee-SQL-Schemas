select * from employees;

select first_name,last_name from employees;

--IN 
SELECT FIRST_NAME ,SALARY FROM EMPLOYEES WHERE SALARY IN (24000);

SELECT FIRST_NAME,SALARY,JOB_ID FROM EMPLOYEES WHERE JOB_ID NOT IN ('IT_PROG');

SELECT FIRST_NAME ,SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID IN (60,90);

--LIKE
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'Al%';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%a';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%f%';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '____s%';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%eve%';
SELECT * FROM EMPLOYEES WHERE LOWER(FIRST_NAME) LIKE 'a%a';
SELECT * FROM EMPLOYEES WHERE REGEXP_LIKE(FIRST_NAME, '^[ab].*[Er]$','i');
SELECT * FROM EMPLOYEES WHERE UPPER(SUBSTR(FIRST_NAME,1,1)) IN ('A','B')
AND UPPER(SUBSTR(FIRST_NAME,-1,1)) IN ('E','R');
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'B%' 
ORDER BY FIRST_NAME ASC;
SELECT * FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE) NOT LIKE '17%';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'S_ev_n';

--DATE FUNCTIOS
SELECT * FROM DUAL;
SELECT SYSDATE FROM DUAL;
--ADD MONTHS
select add_months(sysdate,1) from dual;
select add_months(sysdate,-1) from dual;
--MONTHS BETWEEN
SELECT MONTHS_BETWEEN(SYSDATE,'28-07-2024') FROM DUAL;
SELECT MONTHS_BETWEEN('29-07-2026','28-07-2026') FROM DUAL;
--NEXT DAY
SELECT NEXT_DAY(SYSDATE,4) FROM DUAL;
SELECT NEXT_DAY('12-03-2005',3)FROM DUAL;
--LAST_DAY
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY('01-01-2025') FROM DUAL;
--DATA TYPE FUNCTION
--TO CHAR
SELECT TO_CHAR(SYSDATE,'DAY-MON-YYYY') FROM DUAL;
SELECT TO_CHAR(TO_DATE('13-03-2005','DD-MM-YY'),'DAY-MON-YYYY') FROM DUAL;
--TO DATE
SELECT TO_DATE('13-MARCH-2005') FROM DUAL;

--GREATEST
SELECT GREATEST(3,4,5) FROM DUAL;
--LEAST
SELECT LEAST(3,4,5) FROM DUAL;

SELECT FIRST_NAME,UPPER(FIRST_NAME),LOWER(FIRST_NAME),INITCAP(FIRST_NAME) FROM EMPLOYEES;

--SUBSTR
SELECT FIRST_NAME,SUBSTR(First_Name,4,3) FROM EMPLOYEES;

SELECT FIRST_NAME,INSTR(LAST_NAME,'e',1,1) FROM EMPLOYEES;

SELECT DISTINCT FIRST_NAME,LENGTH(FIRST_NAME) FROM EMPLOYEES
ORDER BY LENGTH(FIRST_NAME) ASC,FIRST_NAME ASC
 ;
 
select department_id,
case 
when department_id = 90 then 'A'
when department_id = 20 then 'B'
when department_id = 30 then 'C'
when department_id = 40 then 'D'
else 'x'
end
from employees;

--WITH mgr_stats AS (
--  SELECT
--    MANAGER_ID,
--    COUNT(DEPARTMENT_ID) AS R,
--    MAX(SALARY) AS MAXI,
--    MIN(SALARY) AS MIN,
--    SUM(SALARY) AS SUM
--  FROM EMPLOYEES
--  GROUP BY MANAGER_ID
--)
--SELECT *
--FROM mgr_stats
--WHERE MAXI > 5000
--ORDER BY R DESC;


--group by
SELECT MANAGER_ID,COUNT(DEPARTMENT_ID) R,MAX(SALARY)AS  MAXI ,MIN(SALARY) MIN ,SUM(SALARY) SUM 
FROM EMPLOYEES
GROUP BY MANAGER_ID
HAVING MAX(SALARY) >15000
ORDER BY R DESC  ;

SELECT * FROM EMPLOYEES;

--WRITE A QUERY WHOSE JOB ID AND MANAGER ID > SALAY 150000

SELECT JOB_ID,MANAGER_ID,SUM(SALARY) AS HIGH_SALARY
FROM EMPLOYEES
GROUP BY JOB_ID ,MANAGER_ID
HAVING SUM(SALARY) > 51000
ORDER BY SUM(SALARY);

SELECT department_id, last_name, salary,
       RANK() OVER (PARTITION BY department_id 
                    ORDER BY salary DESC) AS dept_rank FROM employees;
                    
SELECT department_id, last_name, salary,
       RANK() OVER (
                    ORDER BY salary DESC) AS dept_rank FROM employees;
                    
select sum(salary) from employees;
select first_name, department_id,sum(salary) over(partition by department_id order by salary desc) from employees;
select sum(salary) from employees where first_name = 'Jennifer';
select * from employees where first_name = 'Jennifer';

--rank
select distinct department_id,salary,dense_rank() over(partition by department_id  order by salary ) from employees;

select salary,rank() over(order by salary ) from employees;


--ddl
create table t2
(
name varchar(10),
age number(2)
);

--alter --> rename,drop,add,add constraint,modify,drop 
alter table t2
add B varchar(1);
alter table t2
add c int;

select * from t2;
alter table t2
rename column B to gender;

alter table t2
add constraints C1 unique(c);

desc t2;

alter table t2
modify c varchar(1900);

alter table t2
drop column c;

truncate table t2;

desc t2;

drop table t2;
--subquery


SELECT * FROM EMPLOYEES WHERE 
first_name = 'Neena';


--SUBQUERY
SELECT * FROM EMPLOYEES WHERE SALARY =
(select SALARY from EMPLOYEES WHERE FIRST_NAME ='Neena');

select * from employees;

select * from employees where salary>
(select avg(salary) from employees);

SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY =
(select MAX(SALARY) FROM EMPLOYEES )
UNION
SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY  =
(select MIN (SALARY)FROM EMPLOYEES );


SELECT FIRST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES
WHERE (DEPARTMENT_ID,SALARY )IN
(SELECT DEPARTMENT_ID ,MAX(SALARY)FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);


select * from employees where salary =
(select max(salary) from employees);

SELECT employee_id name
FROM employees e
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
  WHERE department_id = e.department_id
);












