use mydb;

-- 查看是否支持profile操作
select @@have_profiling;

-- 默认profiling是关闭的 0 为没有开启
select @@profiling;

set profiling = 1;

select @@profiling;

select * from user_info;

select count(*) from user_info;

select * from user_info where name = '王五';

show profiles;

show profile for query 101;

show profile cpu for query 101;












