use mydb;

select curdate();

select curtime();

select now();

select year(now());

select month(now());

select day(now());

select date_add(now(),interval 70 day);

select date_add(now(),interval 70 month);


select datediff(now(),date_add(now(),interval 70 day));

select datediff('2025-03-01','2025-03-23');

select datediff('2025-03-23','2025-03-01');

# 查询所有员工的入职天数,并根据入职天数倒序排序
select name,datediff(curdate(),entrydate) as 'entrydays' from emp order by entrydays desc;











