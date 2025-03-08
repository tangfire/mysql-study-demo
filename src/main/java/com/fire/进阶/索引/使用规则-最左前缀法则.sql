use mydb;

show index from user_info;

select * from user_info;

select * from user_info where profession = '金融' and age = 30 and status = 0;

explain select * from user_info where profession = '金融' and age = 30 and status = 0;

explain select * from user_info where profession = '金融' and age = 30;


explain select * from user_info where profession = '金融';

explain select * from user_info where age = 30 and status = 0;

explain select * from user_info where profession = '金融' and status = 0;

explain select * from user_info where age = 30 and status = 0 and profession = '金融';



