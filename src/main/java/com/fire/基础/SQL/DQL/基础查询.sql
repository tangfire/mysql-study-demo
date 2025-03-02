use mydb;

show create table emp;

select * from emp;

delete from emp;

INSERT INTO `emp` (`id`, `workno`, `name`, `gender`, `age`, `idcard`, `entrydate`) VALUES
                                                                                       (1, 'A001', '张三', '男', 28, '110101199001015678', '2020-01-15'),
                                                                                       (2, 'B002', '李四', '男', 35, '120102198505201234', '2019-05-20'),
                                                                                       (3, 'C003', '王梅', '女', 32, '130103199208152345', '2018-11-10'),
                                                                                       (4, 'D004', '陈强', '男', 42, '140104197606301456', '2017-03-05'),
                                                                                       (5, 'E005', '刘娜', '女', 26, '150105200001016789', '2021-07-22'),
                                                                                       (6, 'F006', '赵明', '男', 38, '210106198807112890', '2016-09-18'),
                                                                                       (7, 'G007', '孙丽', '女', 29, '220107199412204567', '2019-12-30'),
                                                                                       (8, 'H008', '周鹏', '男', 45, '230108197203156789', '2015-06-12'),
                                                                                       (9, 'I009', '吴婷', '女', 33, '310109199510267890', '2018-04-25'),
                                                                                       (10, 'J010', '郑华', '男', 36, '320110198902283456', '2017-08-07'),
                                                                                       (11, 'K011', '黄芳', '女', 31, '330111199706154567', '2020-03-16'),
                                                                                       (12, 'L012', '罗强', '男', 40, '340112197512203678', '2016-11-29'),
                                                                                       (13, 'M013', '高洁', '女', 27, '350113200002159012', '2021-01-05'),
                                                                                       (14, 'N014', '林东', '男', 44, '360114197809216789', '2015-07-20'),
                                                                                       (15, 'O015', '徐微', '女', 30, '370115199311277890', '2019-09-03'),
                                                                                       (16, 'P016', '杨帆', '男', 37, '380116198604302345', '2017-05-14'),
                                                                                       (17, 'Q017', '潘云', '女', 34, '390117199707153456', '2018-06-28'),
                                                                                       (18, 'R018', '蒋山', '男', 39, '410118197811204567', '2016-02-17'),
                                                                                       (19, 'S019', '韩雪', '女', 25, '420119200003166789', '2021-09-10'),
                                                                                       (20, 'T020', '曹阳', '男', 41, '430120197705231890', '2015-12-05');

alter table emp add workaddress varchar(255) comment '工作地址';

UPDATE emp SET workaddress = '北京总部' WHERE id = 1;
UPDATE emp SET workaddress = '上海分部' WHERE id = 2;
UPDATE emp SET workaddress = '广州分部' WHERE id = 3;
UPDATE emp SET workaddress = '深圳研发中心' WHERE id = 4;
UPDATE emp SET workaddress = '杭州分公司' WHERE id = 5;
UPDATE emp SET workaddress = '成都分部' WHERE id = 6;
UPDATE emp SET workaddress = '武汉办事处' WHERE id = 7;
UPDATE emp SET workaddress = '重庆分公司' WHERE id = 8;
UPDATE emp SET workaddress = '南京研发中心' WHERE id = 9;
UPDATE emp SET workaddress = '天津分部' WHERE id = 10;
UPDATE emp SET workaddress = '西安办事处' WHERE id = 11;
UPDATE emp SET workaddress = '青岛分公司' WHERE id = 12;
UPDATE emp SET workaddress = '郑州分部' WHERE id = 13;
UPDATE emp SET workaddress = '长沙研发中心' WHERE id = 14;
UPDATE emp SET workaddress = '苏州办事处' WHERE id = 15;
UPDATE emp SET workaddress = '东莞分公司' WHERE id = 16;
UPDATE emp SET workaddress = '宁波分部' WHERE id = 17;
UPDATE emp SET workaddress = '厦门研发中心' WHERE id = 18;
UPDATE emp SET workaddress = '合肥办事处' WHERE id = 19;
UPDATE emp SET workaddress = '济南分公司' WHERE id = 20;


select * from emp;

select name,workno,age from emp;

select `id`, `workno`, `name`, `gender`, `age`, `idcard`, `entrydate` from emp;

select workaddress as '工作地址' from emp;

select workaddress '工作地址' from emp;

# 查询员工的工作地址(不要重复)
select distinct workaddress '工作地址' from emp;

# 查询身份证号后2位是90的员工信息
select * from emp where idcard like '%90';

















