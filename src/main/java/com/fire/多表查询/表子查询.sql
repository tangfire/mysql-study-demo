use mydb;

-- 为表添加 job 字段
ALTER TABLE emp_f
    ADD COLUMN job VARCHAR(50) DEFAULT NULL COMMENT '职位/工作';

-- 更新现有数据的 job 信息
UPDATE emp_f SET job =
                     CASE
                         WHEN name = '张三' THEN 'CEO'
                         WHEN name = '李四' THEN '技术总监'
                         WHEN name = '王五' THEN '人事总监'
                         WHEN name = '赵六' THEN '产品经理'
                         WHEN name = '小明' THEN '高级开发工程师'
                         WHEN name = '小红' THEN '中级开发工程师'
                         WHEN name = '小华' THEN '人事专员'
                         WHEN name = '小强' THEN '行政助理'
                         ELSE '普通员工'
                         END;

-- 插入新的员工记录（包含 job 字段）
INSERT INTO emp_f
(name, gender, age, salary, entry_date, dept_id, manager_id, job)
VALUES
    ('小李', '女', 26, 45000.00, '2023-03-15', 3, 3, '人事助理'),
    ('小王', '男', 29, 55000.00, '2022-11-01', 2, 2, '高级前端工程师'),
    ('小张', '女', 32, 65000.00, '2021-05-20', 1, 1, '市场总监');

select * from emp_f;


select * from emp_f where (job,salary) in (select job,salary from emp_f where name = '李四' or name = '王五'
);



select e.*,d.* from (select * from emp_f where entry_date > '2006-01-01') e left join  dept d on e.dept_id = d.id;



