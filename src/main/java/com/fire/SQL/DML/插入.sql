use mydb;

show tables;

insert into emp(id, workno, name, gender, age, idcard, entrydate) values (1,'1','tangfire','男',10,'441521200103051337','2000-01-01');

# Data truncation: Out of range value for column 'age' at row 1
insert into emp(id, workno, name, gender, age, idcard, entrydate) values (1,'1','tangfire2','男',-1,'441521200103051337','2000-01-01');

insert into emp values (2,'2','tangfire2','男',11,'441521200103051338','2000-02-01');

insert into emp values (3,'3','tangfire3','男',11,'441321200103051338','2000-02-02'),(4,'4','tangfire4','女',21,'441521200103081338','2000-02-02');

select * from emp;








