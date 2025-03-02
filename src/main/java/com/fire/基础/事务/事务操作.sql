use mydb;

create table account(
    id int auto_increment primary key comment '主键id',
    name varchar(10) comment '姓名',
    money int comment '余额'
)comment '账户表';

insert into account(id, name, money) VALUES (null,'张三',2000),(null,'李四',2000);

select * from account;

update account set money = 2000 where name = '张三' or name = '李四';

-- 1为自动提交, 0为手动提交
select @@autocommit;



set @@autocommit = 0;




-- 转账操作 (张三给李四转账1000)
select * from account where name = '张三';

update account set money = money - 1000 where name = '张三';

程序出错 ...

update account set money = money + 1000 where name = '李四';

commit;

rollback;

set @@autocommit = 1;

start transaction ;

-- 转账操作 (张三给李四转账1000)
select * from account where name = '张三';

update account set money = money - 1000 where name = '张三';

程序出错 ...

update account set money = money + 1000 where name = '李四';

rollback ;

commit ;




