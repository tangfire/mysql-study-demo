use mydb;
# 1,查询年龄为30,31,32,33岁的员不信息。

select * from emp where gender = '女' and age in (30,31,32,33);

# 2.查询性别为男，并且年龄在20-40岁（含）以内的姓名为三个字的员工。

select * from emp where gender = '男' and (age between 20 and 40) and name like '___';
# 3.统计员工表中，年龄小于60岁的，男性员工和女性员工的人数。
select gender,count(*) as '数量' from emp where age < 60 group by gender;

# 4.查询所有年龄小于等于35岁员工的姓名和年龄，并对查询结果按年龄升序排序，如果年龄相同按入职时间降序排序。
select name,age from emp where age <= 35 order by age asc,entrydate desc;

# 5.查询性别为男，且年龄在20-40岁（含）以内的前5个员工信息，对查询的结果按年龄升序排序，年龄相同按入职时间升序排序。
select * from emp where gender = '男' and (age between 20 and 40) order by age asc,entrydate asc limit 0,5