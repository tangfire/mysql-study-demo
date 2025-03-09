use mydb;

show tables;

select count(*) from user_info;

select * from user_info limit 0,10;

select * from user_info limit 10,10;

select * from user_info limit 100000,10;

# 优化
select id from user_info order by id limit 100000,10;

# [42000][1235] This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery'
select * from user_info where id in (select id from user_info order by id limit 100000,10);

select s.* from user_info s ,(select id from user_info order by id limit 100000,10) a where a.id = s.id;




