use mydb;

select * from dept;

select * from emp_f;

select * from emp_f where dept_id = (select id from dept where name = '销售部');

select * from emp_f where entry_date > (select entry_date from emp_f where name = '赵六');



