use mydb;
select 
	users.id,
	users.last_name,
    users.first_name,
    prefectures.name
from 
	users 
inner join 
	prefectures 
on users.prefecture_id = prefectures.id;

select 
	u.id,
    u.last_name,
    u.first_name,
    p.name
from
	users as u
inner join
	prefectures as p
on u.prefecture_id = p.id;
-- 内部結合+絞り込み
select
	u.id,
    u.last_name,
    u.first_name,
    p.name
from
	users as u
inner join
	prefectures as p
on u.prefecture_id = p.id
where u.gender = 2;
-- 92.演習
select
	o.id,
    o.order_time,
    o.amount,
    u.id,
    u.last_name,
    u.first_name
from
	orders as o
inner join 
	users as u
on o.user_id = u.id
where 
    u.prefecture_id = 13
    and o.order_time >= '2017-01-01 00:00:00'
    and o.order_time < '2017-02-01 00:00:00'
order by o .id asc;

-- 外部結合
select 
	u.last_name last_name,
    u.id user_id,
    o.user_id order_user_id,
    o.id order_id
from 
	users u
inner join
	orders o 
on u.id = o.user_id 
order by u.id; 
-- left outer join 
select 
	u.last_name last_name,
    u.id user_id,
    o.user_id order_user_id,
    o.id order_id
from 
	users u
left outer join
	orders o 
on u.id = o.user_id 
order by u.id; 
-- inner join は論理積
select 
	*
from
	products p
left outer join
	order_details od
on p.id = od.product_id;

select
	p.id,
    p.name,
    sum(od.product_qty) num
from
	products p
left outer join -- nullも含めて全ての商品の販売個数リストを取得
-- inner join　-- 売上実績のある商品のみの販売個数リストを取得
	order_details od
on p.id = od.product_id
group by p.id;

-- 3つ以上のテーブルを使った結合　＊oracleでは動作しない
select
	o.id order_id,
    o.user_id user_id,
    u.last_name last_name,
    u.first_name first_name,
    o.amount amount,
    o.order_time order_time,
    p.name product_name,
    od.product_qty qty,
    p.price product_price
from
	orders o
inner join
	order_details od
on o.id = od.order_id
inner join
	products p 
on od.product_id = p.id
inner join
	users u
on o.user_id = u.id;

-- 商品ID=3に紐づく商品カテゴリをすべて出力する
select
	p.id product_id,
    p.name product_name,
    c.name category_name
from
	products p
inner join products_categories pc
	on p.id = pc.product_id
inner join categories c
	on pc.category_id = c.id
where
	p.id = 3;
    
-- tableの足し算union union all
select
	email,
	last_name,
	first_name,
	gender
from
	users
union all
select
	email,
	last_name,
	first_name,
	gender
from
	admin_users
    ;
    
select
	email,
	last_name,
	first_name,
	gender
from
	users
where
	gender = 1
union all
select
	email,
	last_name,
	first_name,
	gender
from
	admin_users
where
	gender = 2
order by gender
    ;