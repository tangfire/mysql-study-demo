use mydb;

select * from emp where age = 31;

select * from emp where age < 40;

select * from emp where age <= 40;

INSERT INTO `emp` (`id`, `workno`, `name`, `gender`, `age`, `idcard`, `entrydate`) VALUES
(21, 'A0021', '张三封', '男', 28, null, '2020-01-15');

select * from emp where idcard is null;

select * from emp where idcard is not null;

select * from emp where age != 31;

select * from emp where age <> 31;

select * from emp where age >= 30 and age <= 40;
select * from emp where age >= 30 && age <= 40;

# age >= 30 and age <= 40
select * from emp where age between 30 and 40;

select * from emp where gender = '女' and age = 31;

select * from emp where age = 31 or age = 40 or age = 36;

select * from emp where age in (31,40,36);

# 查询姓名为两个字的员工信息
select * from emp where name like '__';
















