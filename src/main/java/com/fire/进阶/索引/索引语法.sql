use mydb;

CREATE TABLE IF NOT EXISTS user_info (
                                         id INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
                                         name VARCHAR(50) NOT NULL COMMENT '姓名',
                                         phone VARCHAR(20) NOT NULL COMMENT '电话',
                                         email VARCHAR(100) NOT NULL COMMENT '邮箱',
                                         profession VARCHAR(50) COMMENT '专业',
                                         age TINYINT UNSIGNED COMMENT '年龄',
                                         gender ENUM('M','F') COMMENT '性别：M-男性，F-女性',
                                         status TINYINT DEFAULT 1 COMMENT '状态：0-禁用，1-正常',
                                         createtime DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO user_info
(name, phone, email, profession, age, gender, status)
VALUES
    ('张伟', '13912345678', 'zhangwei@example.com', '计算机科学', 28, 'M', 1),
    ('王芳', '13876543210', 'wangfang@test.org', '临床医学', 32, 'F', 1),
    ('李强', '15987654321', 'liqiang@mail.com', '电子工程', 24, 'M', 0),
    ('陈敏', '17788889999', 'chenmin@work.com', '工商管理', 29, 'F', 1),
    ('赵杰', '18600001111', 'zhaojie@edu.cn', '金融学', 35, 'M', 1),
    ('刘丽', '13524681357', 'liuli@example.net', NULL, 22, 'F', 1),
    ('杨勇', '18765432109', 'yangyong@test.com', '建筑学', 40, 'M', 0),
    ('黄艳', '13123456789', 'huangyan@mail.org', '环境科学', 27, 'F', 1),
    ('周涛', '15298765432', 'zhoutao@example.com', '法律', 31, 'M', 1),
    ('吴静', '13698765432', 'wujing@test.net', '教育学', 26, 'F', 1),
    ('徐明', '15876543210', 'xuming@work.org', '艺术设计', 33, 'M', 1),
    ('孙娟', '13456789012', 'sunjuan@example.com', '机械工程', 23, 'F', 0),
    ('马平', '15098765432', 'mapping@test.com', '化学工程', 38, 'M', 1),
    ('胡刚', '13387654321', 'hugang@mail.net', '生物技术', 25, 'M', 1),
    ('朱红', '13765432109', 'zhuhong@work.com', '新闻学', 30, 'F', 1),
    ('郭燕', '15901234567', 'guoyan@example.org', '心理学', 34, 'F', 1),
    ('何波', '13567890123', 'hebo@test.net', '农学', 28, 'M', 0),
    ('高婷', '18976543210', 'gaoting@mail.com', '物理学', 29, 'F', 1),
    ('林军', '13654321098', 'linjun@work.org', '历史学', 45, 'M', 1),
    ('罗玲', '15789012345', 'luoling@example.com', '数学', 31, 'F', 1),
    ('董伟', '13987654321', 'dongwei@test.com', '哲学', 27, 'M', 1),
    ('郑敏', '18876543210', 'zhengmin@mail.org', NULL, 22, 'F', 0),
    ('袁杰', '13789012345', 'yuanjie@work.net', '计算机科学', 33, 'M', 1),
    ('邓丽', '13409876543', 'dengli@example.com', '临床医学', 26, 'F', 1),
    ('钟涛', '15976543210', 'zhongtao@test.org', '电子工程', 36, 'M', 1),
    ('崔芳', '13621098765', 'cuifang@mail.com', '工商管理', 24, 'F', 1),
    ('姜勇', '17712345678', 'jiangyong@work.net', '金融学', 29, 'M', 0),
    ('蔡燕', '13865432109', 'caiyan@example.org', '建筑学', 30, 'F', 1),
    ('贾明', '13579086420', 'jiaming@test.com', '环境科学', 28, 'M', 1),
    ('彭娟', '18709876543', 'pengjuan@mail.org', '法律', 32, 'F', 1);

select * from user_info;


show index from user_info;


# 1.name字段为姓名字段，该字段的值可能会重复，为该字段创建索引。
create index idx_user_name on user_info(name);

show index from user_info;

# 2.phone手机号字段的值，是非空，且唯一的，为该字段创建唯一索引。

create unique index idx_user_phone on user_info(phone);

show index from user_info;

# 3.为profession、age、status创建联合索引。
create index idx_user_pro_age_sta on user_info(profession,age,status);

show index from user_info;

# 4.为email建立合适的索引来提升查询效率。

create index idx_user_email on user_info(email);

show index from user_info;

-- 删除索引
drop index idx_user_email on user_info;