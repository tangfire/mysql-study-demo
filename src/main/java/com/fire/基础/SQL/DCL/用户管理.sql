use mysql;

show tables;

select * from user;

create user 'tangfire'@'localhost' identified by '8888.216';

create user 'fire'@'%' identified by '8888.216';

alter user 'tangfire'@'localhost' identified with mysql_native_password by '123456';

alter user 'tangfire'@'localhost' identified with mysql_native_password by '8888.216';

drop user 'tangfire'@'localhost';

drop user 'fire'@'%';