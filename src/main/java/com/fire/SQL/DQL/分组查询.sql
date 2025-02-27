use mydb;

select gender,count(*) from emp group by gender;

select gender,avg(age) from emp group by gender;

UPDATE emp SET workaddress = '北京' WHERE id IN (1, 2, 11, 16);
UPDATE emp SET workaddress = '上海' WHERE id IN (3, 7, 13, 19);
UPDATE emp SET workaddress = '广州' WHERE id IN (4, 8, 14, 20);
UPDATE emp SET workaddress = '深圳' WHERE id IN (5, 9, 15, 17);
UPDATE emp SET workaddress = '杭州' WHERE id IN (6, 10, 12, 18);

select * from emp;

select emp.workaddress ,count(*)  from emp where age < 45 group by workaddress having count(*) >= 3;

select emp.workaddress ,count(*) as address_count  from emp where age < 45 group by workaddress having address_count >= 3;



