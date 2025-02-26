USE mydb;

CREATE TABLE tb_user(
                        id int comment 'id',
                        name varchar(50) comment '姓名',
                        age int comment '年龄',
                        gender varchar(1) comment '性别'
) comment '用户表';


SHOW TABLES;


DESC tb_user;

SHOW CREATE TABLE tb_user;


