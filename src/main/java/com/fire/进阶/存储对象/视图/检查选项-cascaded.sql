use mydb;

create or replace view stu_v_1 as select id,name from student where id <= 20;

select * from stu_v_1;

insert into stu_v_1 values(6,'Tom');

show create table student;

create or replace view stu_v_1 as select id,name,student_no from student where id <= 20;

insert into stu_v_1 values(6,'Tom','2022009');

select * from stu_v_1;

select * from student;

insert into stu_v_1 values(31,'Jack','1044008');

create or replace view stu_v_1 as select id,name,student_no from student where id <= 20 with cascaded check option ;

insert into stu_v_1 values(32,'Jack216','1044009');

-- cascaded
create or replace view stu_v_1 as select id,name,student_no from student where id <= 20;

select * from stu_v_1;

insert into stu_v_1 values (7,'uiui','20234569');

insert into stu_v_1 values (71,'uiiui','20234590');

create or replace view stu_v_2 as select id,name,student_no from stu_v_1  where id >= 10 with cascaded check option ;

select * from stu_v_2;

-- CHECK OPTION failed 'mydb.stu_v_2'
insert into stu_v_2 values (7,'ololol','7893453');

-- CHECK OPTION failed 'mydb.stu_v_2'
insert into stu_v_2 values (26,'ololol','7893453');

insert into stu_v_2 values (15,'ololol','7893453');

select * from stu_v_2;

create or replace view stu_v_3 as select id,name,student_no from stu_v_2 where id <= 15;

insert into stu_v_3 values (11,'popo','5345232');

insert into stu_v_3 values (18,'pouupo','53455232');

-- CHECK OPTION failed 'mydb.stu_v_3'
insert into stu_v_3 values (28,'pouupo','53455232');

















