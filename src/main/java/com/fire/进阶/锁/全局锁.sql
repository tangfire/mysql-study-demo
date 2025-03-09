use mydb;

flush tables with read lock;

mysqldump -uroot -p123456 mydb > D:/mydb.sql

unlock tables ;

mysqldump --single-transaction -uroot -p123456 mydb > D:/mydb.sql


