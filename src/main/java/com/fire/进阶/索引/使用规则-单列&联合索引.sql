use mydb;

select * from user_info;



show index from user_info;

explain select id,phone,name from user_info where phone = '13912345678' and name = '张伟';

create unique index idx_user_phone_name on user_info(phone,name);

explain select id,phone,name from user_info where phone = '13912345678' and name = '张伟';

explain select id,phone,name from user_info use index(idx_user_phone_name) where phone = '13912345678' and name = '张伟';









