--CREATE TABLE TCL(
-- A NUMBER(10)
-- );
create table t3(
age int
);
select * from t3;
insert into t3 values (1);
commit;
insert all into t3 values (3)
into t3 values (4)
into t3 values (5)
select * from dual;

select * from t3;
rollback ;

insert all into t3 values (3)
into t3 values (6)
into t3 values (7)
select * from dual;

savepoint x;
rollback ;

SELECT * FROM t3;
-- 
-- INSERT INTO TCL VALUES(1);
-- COMMIT;
-- 
-- INSERT INTO TCL VALUES (2);
-- INSERT INTO TCL VALUES(3);
-- 
-- --ROLLBACK WHATEVER RECORD IS AFTER COMMAND THAT IS WILL BE DELETE
-- 
-- ROLLBACK;
--  INSERT INTO TCL VALUES (2);
-- INSERT INTO TCL VALUES(3);
-- 
-- 
-- SAVEPOINT X;
--   INSERT INTO TCL VALUES (4);
-- INSERT INTO TCL VALUES(5);
-- 
-- ROLLBACK TO X;--WHATEVER RECORD ENTER AFTER X THAT WILL BE DE;ETED
-- 
-- SELECT * FROM TCL;
-- 
-- SAVEPOINT Y;
--INSERT INTO TCL VALUES (6);
-- INSERT INTO TCL VALUES(7);
-- 
-- ROLLBACK;
-- 
-- 
