use mydb;

select concat('hello',' mysql');

select lower('HELLO');

select upper('hello');

select lpad('01',5,'-');

select rpad('01',5,'-');

select trim('  hello world   ');

# 索引从1开始
select substring('hello mysql',1,5);

select * from emp;

update emp set workno = lpad(workno,7,'A');



















