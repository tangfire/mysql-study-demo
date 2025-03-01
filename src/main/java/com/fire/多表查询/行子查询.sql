use mydb;

select * from emp_f;

show create table emp_f;

-- 为表添加 manager_id 字段
ALTER TABLE emp_f
    ADD COLUMN manager_id INT DEFAULT NULL COMMENT '上级员工ID';

-- 添加自关联的外键约束（可选）
# ALTER TABLE emp_f
#     ADD CONSTRAINT fk_manager
#         FOREIGN KEY (manager_id)
#             REFERENCES emp_f(id);

-- 插入示例数据（更新现有数据的 manager_id）
UPDATE emp_f SET manager_id =
                     CASE
                         WHEN name = '张三' THEN NULL  -- CEO 或最高级别管理者
                         WHEN name = '李四' THEN 1     -- 直接下属第一级
                         WHEN name = '王五' THEN 1     -- 直接下属第一级
                         WHEN name = '赵六' THEN 2     -- 技术部经理的下属
                         WHEN name = '小明' THEN 4     -- 项目经理的下属
                         WHEN name = '小红' THEN 4     -- 项目经理的下属
                         ELSE NULL
                         END;

-- 验证更新结果
SELECT id, name, manager_id FROM emp_f;

insert into emp_f(name,salary,emp_f.manager_id) values('myl',9500,2);

select * from emp_f where (salary,manager_id) in (select salary,manager_id  from emp_f where name = '赵六');






