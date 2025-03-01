use mydb;

-- 创建学生表（加入学号）
CREATE TABLE student (
                         id INT PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
                         student_no VARCHAR(20) UNIQUE NOT NULL COMMENT '学号',
                         name VARCHAR(50) NOT NULL COMMENT '学生姓名',
                         gender VARCHAR(10) COMMENT '性别',
                         age INT COMMENT '年龄',
                         class VARCHAR(50) COMMENT '班级'
) COMMENT '学生表';

-- 创建课程表
CREATE TABLE course (
                        id INT PRIMARY KEY AUTO_INCREMENT COMMENT '课程ID',
                        course_no VARCHAR(20) UNIQUE NOT NULL COMMENT '课程编号',
                        name VARCHAR(100) NOT NULL COMMENT '课程名称',
                        teacher VARCHAR(50) COMMENT '任课老师',
                        credit DECIMAL(3,1) COMMENT '学分'
) COMMENT '课程表';

-- 创建选课关系表（中间表）
CREATE TABLE student_course (
                                id INT PRIMARY KEY AUTO_INCREMENT COMMENT '选课记录ID',
                                student_no VARCHAR(20) COMMENT '学生学号',
                                course_no VARCHAR(20) COMMENT '课程编号',
                                score DECIMAL(5,2) COMMENT '课程成绩',
                                select_date DATE COMMENT '选课日期',
                                CONSTRAINT fk_student_no FOREIGN KEY (student_no) REFERENCES student(student_no),
                                CONSTRAINT fk_course_no FOREIGN KEY (course_no) REFERENCES course(course_no)
) COMMENT '学生选课关系表';

-- 插入学生数据（加入学号）
INSERT INTO student (student_no, name, gender, age, class) VALUES
                                                               ('2021001', '张三', '男', 20, '2021级计算机1班'),
                                                               ('2021002', '李四', '女', 19, '2021级计算机2班'),
                                                               ('2020003', '王五', '男', 21, '2020级软件工程1班'),
                                                               ('2021004', '赵六', '女', 20, '2021级大数据1班'),
                                                               ('2022005', '小明', '男', 19, '2022级人工智能1班');

-- 插入课程数据（加入课程编号）
INSERT INTO course (course_no, name, teacher, credit) VALUES
                                                          ('C001', 'Java程序设计', '李老师', 3.5),
                                                          ('C002', '数据库原理', '王老师', 4.0),
                                                          ('C003', '计算机网络', '张老师', 3.0),
                                                          ('C004', '操作系统', '赵老师', 4.0),
                                                          ('C005', '算法设计', '刘老师', 3.5);

-- 插入选课关系数据
INSERT INTO student_course (student_no, course_no, score, select_date) VALUES
                                                                           ('2021001', 'C001', 85.5, '2023-09-01'),
                                                                           ('2021001', 'C002', 92.0, '2023-09-01'),
                                                                           ('2021002', 'C001', 78.5, '2023-09-02'),
                                                                           ('2021002', 'C003', 88.0, '2023-09-02'),
                                                                           ('2020003', 'C002', 90.5, '2023-09-03'),
                                                                           ('2020003', 'C004', 85.0, '2023-09-03'),
                                                                           ('2021004', 'C003', 82.5, '2023-09-04'),
                                                                           ('2021004', 'C005', 95.0, '2023-09-04'),
                                                                           ('2022005', 'C004', 88.5, '2023-09-05'),
                                                                           ('2022005', 'C005', 91.0, '2023-09-05');