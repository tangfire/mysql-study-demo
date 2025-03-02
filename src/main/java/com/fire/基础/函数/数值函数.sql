use mydb;

# 2
select ceil(1.5);
select ceil(1.1);

# 1
select floor(1.9);

# 3
select mod(3,4);

# 2
select mod(6,4);

select rand();

select round(2.34,2);

select round(2.36,1);

# 生成一个六位数的随机验证码
select lpad(round(rand()*1000000,0),6,'0');



