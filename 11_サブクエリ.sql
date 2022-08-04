select 
	id,
    last_name,
    email
from
	users
where id not in(
	select
		user_id
	from
		orders
	where
		order_time >= "2017-12-01 00:00:00"
		and order_time < "2018-01-01 00:00:00"
);

-- サブクエリの演習
select
	id,
    last_name,
    email
from
	users
where id in
(
	select 
		user_id
	from 
		orders
	where order_time >= "20171201"
		and order_time < "20180101"
);

-- 応用　全商品の平均単価より、高い商品を取得 
select
	avg(price)
from
	products;

select
	*
from
	products
where price > (
select
	avg(price)
from
	products
)
order by price desc, id asc;
