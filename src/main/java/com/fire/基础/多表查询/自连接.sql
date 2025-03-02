use mydb;

-- 创建员工表（包含上级ID）
CREATE TABLE employee (
                          id INT PRIMARY KEY AUTO_INCREMENT COMMENT '员工ID',
                          name VARCHAR(50) NOT NULL COMMENT '员工姓名',
                          position VARCHAR(50) COMMENT '职位',
                          salary DECIMAL(10,2) COMMENT '薪资',
                          department VARCHAR(50) COMMENT '部门',
                          manager_id INT COMMENT '上级ID'
) COMMENT '员工表';

-- 插入员工数据
INSERT INTO employee (name, position, salary, department, manager_id) VALUES
                                                                          ('张三', 'CEO', 100000.00, '公司总部', NULL),
                                                                          ('李四', '技术总监', 80000.00, '技术部', 1),
                                                                          ('王五', '人事总监', 75000.00, '人事部', 1),
                                                                          ('赵六', '产品经理', 60000.00, '技术部', 2),
                                                                          ('小明', '开发工程师', 50000.00, '技术部', 4),
                                                                          ('小红', '开发工程师', 52000.00, '技术部', 4),
                                                                          ('小华', '人事专员', 45000.00, '人事部', 3),
                                                                          ('小强', '行政助理', 40000.00, '行政部', 1);


select a.name ,b.name from employee a,employee b where a.manager_id = b.id;

select a.name '员工',b.name '领导' from employee a left join employee b on a.manager_id = b.id;

