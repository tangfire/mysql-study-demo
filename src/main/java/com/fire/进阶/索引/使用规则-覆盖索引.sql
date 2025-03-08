use mydb;

show index from user_info;

drop index idx_user_age on user_info;

drop index idx_user_profession on user_info;

show index from user_info;

explain select * from user_info where profession = '金融' and age > 31 and status = 0;

explain select id,profession from user_info where profession = '金融' and age > 31 and status = 0;

explain select id,profession,age from user_info where profession = '金融' and age > 31 and status = 0;

explain select id,profession,age,status from user_info where profession = '金融' and age > 31 and status = 0;

explain select id,profession,age,status,name from user_info where profession = '金融' and age > 31 and status = 0;










