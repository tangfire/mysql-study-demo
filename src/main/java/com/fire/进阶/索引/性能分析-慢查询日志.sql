use mydb;

-- 慢查询日志默认没有开启
show variables like 'slow_query_log';


SET GLOBAL slow_query_log = ON;

SET GLOBAL long_query_time = 2;

show variables like 'slow_query_log_file';

select * from user_info;

select count(*) from user_info;

show create table user_info;






