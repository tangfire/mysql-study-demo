use mydb;

create view stu_v_count as select count(*) from student;

select * from stu_v_count;

-- The target table stu_v_count of the INSERT is not insertable-into
insert into stu_v_count values (10);




