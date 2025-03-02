use mydb;

select *
from dept;

select *
from emp_f;

select *
from emp_f
where dept_id in (select id from dept where name = '销售部' or name = '市场部');


-- all与some效果相同
select *
from emp_f
where salary <
          all (select salary
               from emp_f
               where dept_id =
                     (select id from dept where name = '财务部'));


select *
from emp_f
where salary <
          some (select salary
               from emp_f
               where dept_id =
                     (select id from dept where name = '财务部'));



select *
from emp_f
where salary > any (select salary from emp_f where dept_id = (select id from dept where name = '市场部'));


