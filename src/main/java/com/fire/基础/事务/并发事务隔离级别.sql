use mydb;

-- 查看事务隔离级别
select @@transaction_isolation;

set session transaction isolation level read uncommitted ;

set session transaction isolation level repeatable read ;







