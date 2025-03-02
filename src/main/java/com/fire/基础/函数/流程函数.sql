use mydb;
-- if
select if(true,'Ok','Error');

select if(false,'Ok','Error');

-- ifnull
select ifnull('Ok','Default');

select ifnull('','Default');

select ifnull(null,'Default');

-- case when then else end
-- 需求: 查询emp表的员工姓名和工作地址 (北京/上海/广州 ---> 一线城市,其他 ---> 二线城市)
select
    name,
    (case workaddress when '北京' then '一线城市' when '上海' then '一线城市' when '广州' then '一线城市' else '二线城市' end) as '工作地址'
from emp;


SELECT
    name,
    CASE WHEN workaddress IN ('北京', '上海', '广州') THEN '一线城市'
         ELSE '二线城市' END AS '工作地址'
FROM emp;


create table score(
    id int comment 'ID',
    name varchar(20) comment '姓名',
    math int comment '数学',
    english int comment '英语',
    chinese int comment '语文'
) comment '学员成绩表';


-- 清空表（可选）
TRUNCATE TABLE score;

-- 清空表（可选）
TRUNCATE TABLE score;

-- 插入更加随机的数据
INSERT INTO score (id, name, math, english, chinese) VALUES
                                                         (1, '张三', 62, 75, 58),
                                                         (2, '李四', 89, 92, 86),
                                                         (3, '王五', 45, 53, 67),
                                                         (4, '赵六', 78, 81, 69),
                                                         (5, '小明', 55, 64, 72),
                                                         (6, '小红', 93, 88, 95),
                                                         (7, '小华', 67, 59, 61),
                                                         (8, '小林', 82, 76, 84),
                                                         (9, '小芳', 51, 48, 55),
                                                         (10, '小强', 73, 69, 77);




select * from score;

select
    id,
    name,
    (case when math >= 85 then '优秀' when math >= 60 then '及格' else '不及格' end) '数学',
    (case when english >= 85 then '优秀' when english >= 60 then '及格' else '不及格' end) '英语',
    (case when chinese >= 85 then '优秀' when chinese >= 60 then '及格' else '不及格' end) '语文'
from score;










