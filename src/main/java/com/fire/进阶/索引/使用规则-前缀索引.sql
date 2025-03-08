use mydb;

select * from user_info;

select count(*) from user_info;

select count(distinct email) from user_info;

select count(distinct email)/ count(*) from user_info;



select count(distinct substring(email,1,8))/ count(*) from user_info;

select count(distinct substring(email,1,5))/ count(*) from user_info;

create index idx_email_8 on user_info(email(8));

show index from user_info;

select * from user_info where email = 'liqiang@mail.com';
















