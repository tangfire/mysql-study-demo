create database mydb02;

use mydb02;

-- 创建部门表
CREATE TABLE dept (
                      id INT PRIMARY KEY AUTO_INCREMENT,
                      name VARCHAR(50) COMMENT '部门名称'
);

-- 创建工资等级表
CREATE TABLE salgrade (
                          grade INT PRIMARY KEY,
                          losal DECIMAL(10,2),
                          hisal DECIMAL(10,2)
);

-- 创建员工表
CREATE TABLE emp (
                     id INT PRIMARY KEY AUTO_INCREMENT,
                     name VARCHAR(50) COMMENT '员工姓名',
                     gender VARCHAR(10) COMMENT '性别',
                     age INT COMMENT '年龄',
                     job VARCHAR(50) COMMENT '职位',
                     salary DECIMAL(10,2) COMMENT '工资',
                     entry_date DATE COMMENT '入职日期',
                     manager_id INT COMMENT '上级ID',
                     dept_id INT COMMENT '部门ID',
                     FOREIGN KEY (dept_id) REFERENCES dept(id),
                     FOREIGN KEY (manager_id) REFERENCES emp(id)
);

-- 插入部门数据
INSERT INTO dept (name) VALUES
                            ('总裁办'),
                            ('研发部'),
                            ('人事部'),
                            ('市场部'),
                            ('财务部');

-- 插入工资等级数据
INSERT INTO salgrade (grade, losal, hisal) VALUES
                                               (1, 0, 3000),
                                               (2, 3001, 5000),
                                               (3, 5001, 8000),
                                               (4, 8001, 12000),
                                               (5, 12001, 20000);


INSERT INTO salgrade (grade, losal, hisal) VALUES
                                               (6, 20001, 30000),
                                               (7, 30001, 50000),
                                               (8, 50001, 80000);

-- 插入员工数据
INSERT INTO emp (name, gender, age, job, salary, entry_date, dept_id, manager_id) VALUES
                                                                                      ('张无忌', '男', 25, '软件工程师', 3000.00, '2020-01-01', 2, NULL),
                                                                                      ('灭绝', '女', 45, '研发总监', 12000.00, '2015-01-01', 2, NULL),
                                                                                      ('周芷若', '女', 28, '软件工程师', 5000.00, '2018-06-01', 2, 2),
                                                                                      ('赵敏', '女', 35, '人事经理', 6000.00, '2016-01-01', 3, NULL),
                                                                                      ('小昭', '女', 22, '人事助理', 3500.00, '2021-01-01', 3, 4),
                                                                                      ('宋青书', '男', 40, '市场总监', 10000.00, '2015-05-01', 4, NULL),
                                                                                      ('杨过', '男', 30, '市场专员', 5500.00, '2019-01-01', 4, 6),
                                                                                      ('郭靖', '男', 50, 'CEO', 20000.00, '2010-01-01', 1, NULL),
                                                                                      ('黄蓉', '女', 38, '财务总监', 8000.00, '2016-01-01', 5, NULL);

-- 验证数据
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * FROM emp;




# 1. 查询员工的姓名、年龄、职位、部门信息。
# 2. 查询年龄小于30岁的员工姓名、年龄、职位、部门信息。
# 3. 查询拥有员工的部门D、部门名称。
# 4. 查询所有年龄大于40岁的员工，及其归属的部门名称：如果员工没有分配部门，也需要展示出来。
# 5. 查询所有员工的工资等级。
# 6. 查询"研发部”所有员工的信息及工资等级。
# 7. 查询"研发部"员工的平均工资。
# 8. 查询工资比"灭绝"高的员工信息。
# 9. 查询比平均薪资高的员工信息。
# 10. 查询低于本部门平均工资的员工信息。
# 11. 查询所有的部门信息，并统计部门的员工人数。
# 12. 查询所有学生的选课情况，展示出学生名称，学号，课程名称