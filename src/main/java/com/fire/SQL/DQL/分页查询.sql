use mydb;

# 1. 查询第1页员工数据,每一页展示10条数据
select * from emp limit 0,10;
select * from emp limit 10;



# 2. 查询第2页员工数据,每一页展示10条数据---> (页码-1) * 页展示记录数
select * from emp limit 10,10;






