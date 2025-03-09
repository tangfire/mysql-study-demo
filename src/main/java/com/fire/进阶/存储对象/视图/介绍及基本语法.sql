use mydb;

show tables;

select * from student;


create or replace view stu_v_1 as select id,name from student where id <= 10;

show create view stu_v_1;

select * from stu_v_1;

select * from stu_v_1 where id < 3;

create or replace view stu_v_1 as select id,name,gender from student where id <= 10;

select * from stu_v_1;

alter view stu_v_1 as select id,name from student where id <= 10;

select * from stu_v_1;

drop view if exists stu_v_1;














