use mydb;

-- 创建部门表
CREATE TABLE dept (
                      id INT PRIMARY KEY AUTO_INCREMENT COMMENT '部门ID',
                      name VARCHAR(50) NOT NULL COMMENT '部门名称',
                      location VARCHAR(100) COMMENT '部门位置'
) COMMENT '部门表';

-- 创建员工表
CREATE TABLE emp_f (
                     id INT PRIMARY KEY AUTO_INCREMENT COMMENT '员工ID',
                     name VARCHAR(50) NOT NULL COMMENT '员工姓名',
                     gender VARCHAR(10) COMMENT '性别',
                     age INT COMMENT '年龄',
                     salary DECIMAL(10,2) COMMENT '工资',
                     entry_date DATE COMMENT '入职日期',
                     dept_id INT COMMENT '部门ID',
                     CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES dept(id)
) COMMENT '员工表';

alter table emp_f drop foreign key fk_dept;



-- 添加外键
alter table emp_f add constraint fk_dept foreign key (dept_id) references dept(id);

-- 插入部门数据
INSERT INTO dept (name, location) VALUES
                                      ('人事部', '总部大楼A座'),
                                      ('技术部', '总部大楼B座'),
                                      ('市场部', '总部大楼C座'),
                                      ('财务部', '总部大楼D座'),
                                      ('销售部', '总部大楼E座');

-- 插入员工数据
INSERT INTO emp_f (name, gender, age, salary, entry_date, dept_id) VALUES
                                                                     ('张三', '男', 28, 8000.00, '2021-03-15', 2),
                                                                     ('李四', '女', 35, 12000.00, '2019-06-20', 1),
                                                                     ('王五', '男', 42, 15000.00, '2017-01-10', 4),
                                                                     ('赵六', '女', 31, 9500.00, '2020-09-05', 3),
                                                                     ('小明', '男', 26, 7200.00, '2022-02-18', 2),
                                                                     ('小红', '女', 33, 10000.00, '2018-11-30', 5),
                                                                     ('小华', '男', 39, 13000.00, '2016-07-22', 1),
                                                                     ('小林', '女', 29, 8500.00, '2021-05-12', 3),
                                                                     ('小芳', '女', 36, 11000.00, '2019-08-25', 4),
                                                                     ('小强', '男', 27, 7800.00, '2022-01-07', 5);

-- Cannot delete or update a parent row: a foreign key constraint fails (`mydb`.`emp_f`, CONSTRAINT `fk_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`))
delete from dept where name = '人事部';



