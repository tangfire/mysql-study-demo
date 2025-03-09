use mydb;

-- 1. 为了保证数据库表的安全性,开发人员在操作user_info表时,只能看到用户的基本字段,屏蔽手机号和邮箱两个字段
create view user_info_view as select id,name,profession,gender,status,createtime from user_info;

select * from user_info_view;

-- 2. 查询每个学生所选修的课程(三张表联查),这个功能在很多业务中都有使用,为了简化操作,定义一个视图
select s.name,s.student_no,c.name from student s,student_course sc,course c where s.student_no = sc.student_no and sc.course_no = c.course_no;

create or replace view tb_stu_course_view as select s.name student_name,s.student_no,c.name course_name from student s,student_course sc,course c where s.student_no = sc.student_no and sc.course_no = c.course_no;

select * from tb_stu_course_view;








