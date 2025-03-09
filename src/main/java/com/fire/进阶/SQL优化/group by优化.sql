use mydb;

show index from user_info;

drop index idx_user_pro_age_sta on user_info;

drop index idx_user_age_phone on user_info;

drop index idx_user_age_pho_ad on user_info;

drop index idx_email_8 on user_info;

select profession,count(*) from user_info group by profession;

explain select profession,count(*) from user_info group by profession;

create index idx_user_pro_age_sta on user_info(profession,age,status);

explain select profession,count(*) from user_info group by profession;

explain select age,count(*) from user_info group by age;

explain select profession,age,count(*) from user_info group by profession,age;

explain select age,count(*) from user_info where profession = '计算机科学' group by age ;







