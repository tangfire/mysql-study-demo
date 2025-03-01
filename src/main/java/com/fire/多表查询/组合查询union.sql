use mydb;

show create table employee;



-- 为表添加 age 字段
ALTER TABLE employee
    ADD COLUMN age INT COMMENT '员工年龄';

-- 更新现有数据的年龄
UPDATE employee SET age =
                        CASE
                            WHEN name = '张三' THEN 45
                            WHEN name = '李四' THEN 40
                            WHEN name = '王五' THEN 38
                            WHEN name = '赵六' THEN 35
                            WHEN name = '小明' THEN 28
                            WHEN name = '小红' THEN 27
                            WHEN name = '小华' THEN 32
                            WHEN name = '小强' THEN 25
                            ELSE NULL
                            END;

-- 验证更新结果
SELECT id, name, age, position, department FROM employee;

-- 如果需要，可以添加年龄约束
ALTER TABLE employee
    MODIFY COLUMN age INT CHECK (age >= 18 AND age <= 65);


select * from employee;


select * from employee where salary < 50000
union all
select * from employee where age > 30;

-- 去重
select * from employee where salary < 50000
union
select * from employee where age > 30;


