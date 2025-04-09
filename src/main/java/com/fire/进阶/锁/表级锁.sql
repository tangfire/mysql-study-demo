use mydb;

show tables;

desc score;

# 表锁

lock tables score read;

select * from score;

# [HY000][1099] Table 'score' was locked with a READ lock and can't be updated
update score set math = 100 where id = 2;

unlock tables;

update score set math = 100 where id = 2;

select * from score;


lock tables score write;

update score set math = 99 where id = 2;

select * from score;

unlock tables;

# 元数据锁


SELECT object_type, object_name, lock_type, lock_duration
FROM performance_schema.metadata_locks;  -- 显示当前MDL锁状态


# 意向锁

SHOW VARIABLES LIKE 'performance_schema';

begin;

select * from score where id = 1 lock in share mode;

select object_schema,object_name,index_name,lock_type,lock_mode,lock_data from performance_schema.data_locks;


commit;









