use mydb;

-- 存储函数
-- 从1到n的累加

create function funSum(n int)
returns int deterministic
begin
    declare total int default 0;

    while n > 0 do
        set total := total + n;
        set n := n -1;
    end while;

    return total;
end;

select funSum(100);

select funSum(50);