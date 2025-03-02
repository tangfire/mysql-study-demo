use mydb;

show create table account;

show engines;

create table my_myisam(
    id int,
    name varchar(10)
)engine = MyISAM;

create table my_memory(
    id int,
    name varchar(10)
)engine = Memory;

show variables like 'innodb_file_per_table';




