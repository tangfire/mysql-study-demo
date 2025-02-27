use mysql;

select * from user;

create user 'tangfire'@'*' identified by '8888.216';

# 查询权限
show grants for 'tangfire'@'*';

# 授予权限
grant all on mydb.* to 'tangfire'@'*';
grant all on *.* to 'tangfire'@'*';

# 撤销权限
revoke all on mydb.* from 'tangfire'@'*';











