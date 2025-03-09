use mydb;

-- 触发器
-- 需求: 通过触发器记录user_info表的数据变更日志(user_logs),包含增加,修改,删除

-- 准备工作: 日志表 user_logs

create table user_logs(
    id int(11) not null auto_increment,
    operation varchar(20) not null comment '操作类型,insert / update / delete',
    operate_time datetime not null comment '操作时间',
    operate_id int(11) not null comment '操作的ID',
    operate_params varchar(500) comment '操作参数',
    primary key (`id`)
)engine = innodb default charset = utf8;

-- 插入数据触发器
create trigger tb_user_insert_trigger
    after insert on user_info for each row
begin
    insert into user_logs(id, operation, operate_time, operate_id, operate_params) values
    (null,'insert',now(),new.id,concat('插入的数据内容为:id=',new.id,',name=',new.name,',phone=',new.phone,',email=',new.email,',profession=',new.profession));

end;

show triggers;

drop trigger tb_user_insert_trigger;

-- 插入数据到user_info

select * from user_info;

insert into user_info(id, name, phone, email, profession, age, gender, status, createtime) values
(null,'tangfire','13014234200','52628216@qq.com','软件工程',19,'M',1,now());

select * from user_logs;

-- update
-- 插入数据触发器
create trigger tb_user_update_trigger
    after update on user_info for each row
begin
    insert into user_logs(id, operation, operate_time, operate_id, operate_params) values
        (null,'update',now(),new.id,concat('更新之前的数据:id=',old.id,',name=',old.name,',phone=',old.phone,',email=',old.email,',profession=',old.profession,
                                           '| 更新之后的数据:id=',new.id,',name=',new.name,',phone=',new.phone,',email=',new.email,',profession=',new.profession));

end;

show triggers;

update user_info set name = 'tangfire216' where name = 'tangfire';

select * from user_logs;

update user_info set profession = '计算机科学与技术' where id <= 5;

select * from user_logs;

-- delete
create trigger tb_user_delete_trigger
    after delete on user_info for each row
begin
    insert into user_logs(id, operation, operate_time, operate_id, operate_params) values
        (null,'delete',now(),old.id,concat('删除的数据内容为:id=',old.id,',name=',old.name,',phone=',old.phone,',email=',old.email,',profession=',old.profession));

end;

show triggers;


delete from user_info where name = 'tangfire216';

select * from user_logs;








