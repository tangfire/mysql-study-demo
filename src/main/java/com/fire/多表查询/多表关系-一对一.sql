use mydb;

-- 用户基本信息表
CREATE TABLE user_base (
                           id INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
                           name VARCHAR(50) NOT NULL COMMENT '姓名',
                           age INT COMMENT '年龄',
                           gender VARCHAR(10) COMMENT '性别',
                           phone VARCHAR(20) UNIQUE COMMENT '手机号'
) COMMENT '用户基本信息表';

-- 用户详细信息表
CREATE TABLE user_detail (
                             id INT PRIMARY KEY AUTO_INCREMENT COMMENT '详细信息ID',
                             userid INT UNIQUE COMMENT '用户ID',
                             degree VARCHAR(50) COMMENT '学历',
                             major VARCHAR(100) COMMENT '专业',
                             primaryschool VARCHAR(100) COMMENT '小学',
                             middleschool VARCHAR(100) COMMENT '中学',
                             university VARCHAR(100) COMMENT '大学',
                             CONSTRAINT fk_user_detail FOREIGN KEY (userid) REFERENCES user_base(id)
) COMMENT '用户详细信息表';

-- 插入用户基本信息数据
INSERT INTO user_base (name, age, gender, phone) VALUES
                                                     ('张三', 25, '男', '13800138000'),
                                                     ('李四', 30, '女', '13900139000'),
                                                     ('王五', 28, '男', '13700137000'),
                                                     ('赵六', 35, '女', '13600136000'),
                                                     ('小明', 22, '男', '13500135000');

-- 插入用户详细信息数据
INSERT INTO user_detail (userid, degree, major, primaryschool, middleschool, university) VALUES
                                                                                             (1, '本科', '计算机科学', '北京市第一小学', '北京市第一中学', '北京大学'),
                                                                                             (2, '硕士', '软件工程', '上海市第二小学', '上海市第二中学', '清华大学'),
                                                                                             (3, '博士', '人工智能', '广州市第三小学', '广州市第三中学', '中国科学技术大学'),
                                                                                             (4, '本科', '数据科学', '深圳市第四小学', '深圳市第四中学', '复旦大学'),
                                                                                             (5, '硕士', '网络工程', '杭州市第五小学', '杭州市第五中学', '浙江大学');