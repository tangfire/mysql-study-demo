use mydb;

# null值是不参与聚合函数计算的

select count(*) from emp;

select count(id) from emp;

select avg(age) from emp;

select max(age) from emp;

select min(age) from emp;

select * from emp;


select * from emp where workaddress like '%公司';

select sum(age) from emp where workaddress like '%公司';
















