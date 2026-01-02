--create table 

--DML
--SELECT 
--INSERT
--UPDATE
--DELETE
create table bank22(
name varchar(100),
id int not null
);

insert into bank22 values('ani',101);
insert all 
into bank22 values('adi',22)
into bank22 values('kaidi',46)
select * from dual;

update bank22 set id = 77 where id = 46;

update bank22 set id = 45 where id = 22;

select * from bank22;
insert into bank values('Sbi',12);
insert into bank(name) values('KT');

insert all
into bank values ('Canara',114)
into bank values('Karnataka',121)
select * from dual;

update bank set name ='State Bank Of India ' where name = 'Sbi';

select * from bank;

update bank
set id = 12 where  name = 'KT';

UPDATE bank
SET name = CASE
              WHEN id = 12 AND name = 'State Bank Of India ' THEN 'kt'
              WHEN id = 14 THEN 'kt'
              ELSE name
           END
WHERE (id = 12 AND name = 'State Bank Of India ')
   OR id = 14;
select * from bank;





