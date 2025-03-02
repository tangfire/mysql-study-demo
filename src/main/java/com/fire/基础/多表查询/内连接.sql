use mydb;

-- 内连接演示
-- 1. 查询每一个员工的姓名,以及关联的部门的名称(隐式内连接实现)
select emp_f.name,dept.name from emp_f ,dept where emp_f.dept_id = dept.id;

select e.name,d.name from emp_f e,dept d where e.dept_id = d.id;

-- 2. 查询每一个员工的姓名,以及关联的部门的名称(显式内连接实现)

select e.name,d.name from emp_f e inner join dept d on e.dept_id = d.id;


select e.name,d.name from emp_f e join dept d on e.dept_id = d.id;