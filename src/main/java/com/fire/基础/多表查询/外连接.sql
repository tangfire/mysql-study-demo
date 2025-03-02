use mydb;

select e.*,d.name from emp_f e left outer join dept d on e.dept_id = d.id;

select e.*,d.name from emp_f e left join dept d on e.dept_id = d.id;

select e.*,d.* from emp_f e right join dept d on e.dept_id = d.id;

select e.*,d.* from dept d left join emp_f e on e.dept_id = d.id;

