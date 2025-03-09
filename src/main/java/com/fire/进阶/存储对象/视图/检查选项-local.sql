use mydb;


select * from student;

create or replace view stu_v_4 as select id,name,student_no from student where id <=15;


insert into stu_v_4 values (6,'jack','1342345');

insert into stu_v_4 values (16,'jack','1349345');


select * from stu_v_4;

create or replace view stu_v_5 as select id,name,student_no from stu_v_4 where id >= 10 with local check option;

insert into stu_v_5 values (13,'oioi','3452523');

insert into stu_v_5 values (17,'uidsa','35244332');


create or replace view stu_v_6 as select id,name ,student_no from stu_v_5 where id < 20;

insert into stu_v_6 values (14,'u2idsa','35344332');

-- CHECK OPTION failed 'mydb.stu_v_6'
insert into stu_v_6 values (9,'u2i4dsa','353442332');












