-- select * from products;
/* select * from users; */
-- select id, last_name from users;

-- select * from products LIMIT 0, 1000;

-- select name, price from products;
-- select name as 名前, price from products; -- 別名で取得
-- select name 名前, price 価格 from products; -- as は省略可能  
-- 43
-- select 
-- 	name as 名前,
--     price as 価格,
--     price * 1.08 as 税込価格
-- from 
-- 	products;
-- 44 where句
-- select name,price from products where price >= 9800;

-- select * from products;
-- select * from users where id = 1;
-- select * from products where name = "商品0003";
-- select * from products where price > 1000;
-- select * from products where price < 1000;
-- select * from products where price <> 100;
-- select * from products where price != 100;
-- select * from products where id in (1,2,3);
-- select * from products where id not in (1,2,3);
-- select * from products where price is not null;
-- select * from products where price is null;
-- select * from products where price between 1000 and 1900;
-- select * from products where price >= 1000 and price <= 1900;
-- select * from products where price = 1000 or price = 2000;

-- パターンマッチングによる絞り込み　like
select * from users where last_name like '中%';
select * from users where last_name like '%中%';
select * from users where first_name like '%子';
select * from users where first_name like '__子';

-- limit 句　取得件数を制限できる
select * from products limit 10;
select * from products limit 0, 10;
select * from products limit 10, 10; -- id10から10レコード取得 

select 
	id,
    last_name,
    gender
from
	users
where
	gender = 1
limit 10;
