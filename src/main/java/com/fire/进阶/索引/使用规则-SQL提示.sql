use mydb;

explain select * from user_info where profession = '金融';

explain select * from user_info use index(idx_user_profession) where profession = '金融';

explain select * from user_info ignore index(idx_user_pro_age_sta) where profession = '金融';

explain select * from user_info force index(idx_user_profession) where profession = '金融';

