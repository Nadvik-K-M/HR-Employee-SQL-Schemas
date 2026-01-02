select distinct e1.salary from employees e1
where 2 = (select count(distinct e2.salary) from employees e2 where e2.salary>e1.salary);



create table A1(
name varchar2(20) not null,
id number(10) primary key,
mob_no number(10) not null
);

insert all 
into A1 values ('ABC',1,9887665433)
into A1 values ('ABV',2,0998871655)
into A1 values ('ABd',3,0998771655)
select * from dual;



alter table ball
add weight number(10);


