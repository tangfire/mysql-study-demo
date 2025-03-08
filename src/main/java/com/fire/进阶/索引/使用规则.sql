use mydb;

select * from user_info where profession = '金融' and age > 30 and status = '0';


explain select * from user_info where profession = '金融' and age > 30 and status = '0';


explain select * from user_info where profession = '金融' and age >= 30 and status = '0';

select * from user_info;

show index from user_info;

select * from user_info where phone = '13524681357';

explain select * from user_info where phone = '13524681357';

select * from user_info where substring(phone,10,2) = 15;

explain select * from user_info where substring(phone,10,2) = 15;

explain select * from user_info where phone = 13524681357;


explain select * from user_info where profession = '计算机科学' and age = 31 and status = '1';


explain select * from user_info where profession like '金%';

explain select * from user_info where profession like '%融';

show index from user_info;

explain select * from user_info where id = 10 or age = 23;

explain select * from user_info where phone = '13524681357' or age = 31;

create index idx_user_age on user_info(age);

explain select * from user_info where phone >= '13912345000';

show index from user_info;


explain select * from user_info where profession is null;

explain select * from user_info where profession is not null;

create index idx_user_profession on user_info(profession);

explain select * from user_info where profession = '金融';










