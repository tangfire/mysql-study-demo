use mydb;

show tables;

select * from user_info where id = 1;

explain select * from user_info where id = 1;

select * from course;

select * from student;

select * from student_course;

select s.*,c.* from student s,course c,student_course sc where s.student_no = sc.student_no and c.course_no = sc.course_no;

explain select s.*,c.* from student s,course c,student_course sc where s.student_no = sc.student_no and c.course_no = sc.course_no;


select course_no from course c where c.name like '%Java%';

select sc.student_no from student_course sc where sc.course_no = 'C001';

select * from student s where s.student_no in ('2021001','2021002');

select * from student s where s.student_no in (select sc.student_no from student_course sc where sc.course_no = (select course_no from course c where c.name like '%Java%'));

explain select * from student s where s.student_no in (select sc.student_no from student_course sc where sc.course_no = (select course_no from course c where c.name like '%Java%'));



