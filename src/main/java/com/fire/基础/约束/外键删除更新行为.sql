use mydb;

alter table emp_f drop foreign key fk_dept;

alter table emp_f add constraint fk_dept foreign key (dept_id) references dept(id) on update cascade on delete cascade;

select * from emp_f;

select * from dept;

desc dept;



update dept set id = 6 where id = 1;

select * from emp_f;

delete from dept where id = 6;

alter table emp_f drop foreign key fk_dept;

alter table emp_f add constraint fk_dept foreign key (dept_id) references dept(id) on update set null on delete set null;


delete from dept where id = 2;

update dept set id = 9 where id = 4;


select * from emp_f;

select * from dept;













