create table ball(
name varchar2(10) not null,
Bsize number(10) not null,
Bno number(10) primary key
);

select * from ball;

insert into ball values('Nivia',20,101);

insert all 
into  ball values ('Nag',40,102)
into ball values ('Mag',50,103)
into ball values ('Dog',10,104)
select * from dual;

select * from ball;

update ball
set name = 'PIG' where name = 'Nag'; -- Update table 

rename balls to ball;  -- Rename table

delete from ball where  name ='Dog'; --delete


alter table ball
add weight number(10);

select * from ball;

--ddl
--alter
alter table ball
add  strength varchar(2);

alter table ball
modify strength number(10); -- change data type

alter table ball
rename column strength to hard;

alter table ball
drop column hard;

alter table ball
add constraints bno check (bno<106);

rename ball to b1;
rename b1 to ball;

--dml
-- insert 
insert into ball (name,bsize,bno) values ('tip',104,99);

update ball
set weight = 39 where bno =99;

select * from ball;

update ball
set weight = case 
when bno = 101 then 83
when bno = 102 then 34
when bno = 103 then 78
end
where bno in(101,102,103);

delete from ball where name = 'tip';

-- SQl
 select * from employees;
 select * from departments;
 
select e.first_name,e.last_name,d.department_name ,e.department_id,d.department_id
from employees e
inner join departments d
on e.department_id = d.department_id;

select max(salary) from employees;

select department_id,max(salary)
from employees
group by
department_id
order by department_id
;

select e.*,
min(salary) over(partition by department_id) as max from employees e ;

select e.*,
max(salary) over(partition by hire_date) from employees e;

select e.*,
row number() over() as rn 
from employees e;


























