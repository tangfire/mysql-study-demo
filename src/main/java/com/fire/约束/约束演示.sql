use mydb;

show tables;


create table user(
    id int primary key auto_increment comment '主键',
    name varchar(10) not null unique comment '姓名',
    age int check (age > 0 and age <= 120) comment '年龄',
    status char(1) default '1' comment '状态',
    gender char(1) comment '性别'
)comment '用户表';

insert into user(name,age,status,gender) values('Tom',19,'1','男'),
                                               ('Jack',21,'0','男');


select * from user;

-- Column 'name' cannot be null
insert into user(name,age,status,gender) values (null,19,'1','男');

-- Duplicate entry 'Tom' for key 'user.name'
insert into user(name, age, status,gender) values('Tom',19,'1','男');

insert into user(name, age, status, gender) values ('Lun',80,'1','男');

-- Check constraint 'user_chk_1' is violated.
insert into user(name, age, status, gender) values ('Lun',-1,'1','男');

-- Check constraint 'user_chk_1' is violated.
insert into user(name, age, status, gender) values ('LunKan1',121,'1','男');

insert into user(name, age, gender) VALUES ('TomGGG',120,'男');

select * from user;







