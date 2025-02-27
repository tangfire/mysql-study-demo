use mydb;

select * from emp order by age asc;

# 默认asc
select * from emp order by age;

select * from emp order by age desc;

select * from emp order by entrydate desc;

select * from emp order by age asc,entrydate desc;

select * from emp order by age asc,entrydate asc;

select * from emp order by age ,entrydate;





