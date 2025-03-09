use mydb;

show index from user_info;

drop index idx_user_phone on user_info;

drop index idx_user_name on user_info;


drop index idx_user_phone_name on user_info;


select id,age,phone from user_info order by age;

explain select id,age,phone from user_info order by age;

explain select id,age,phone from user_info order by age,phone;

create index idx_user_age_phone on user_info(age,phone);

explain select id,age,phone from user_info order by age;


explain select id,age,phone from user_info order by age,phone;

explain select id,age,phone from user_info order by age desc,phone desc;

explain select id,age,phone from user_info order by phone,age;

explain select id,age,phone from user_info order by age asc,phone desc;

show index from user_info;

create index idx_user_age_pho_ad on user_info(age asc,phone desc);

explain select id,age,phone from user_info order by age asc,phone desc;

explain select id,age,phone from user_info order by age asc,phone asc;

explain select * from user_info order by age asc,phone asc;

show variables like 'sort_buffer_size';









