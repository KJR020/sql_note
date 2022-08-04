-- 平均客単価を求める
select
	round(avg(o.amount),0)
from
	orders o;
    
-- 月別平均客単価を求める
select
	date_format(order_time, '%Y%m') as order_year_month,
    round(avg(amount),0) as average_customer_spend
from 
	orders
group by 
	date_format(order_time, '%Y%m')
order by order_year_month;

-- 都道府県別平均客単価を求める
select
	pref.id as prefecture_id,
    pref.name as prefecture_name,
    round(avg(o.amount),0) as average_customer_spend
from
	orders o
inner join users u
on o.user_id = u.id
inner join prefectures as pref
	on u.prefecture_id = pref.id
group by pref.id;

-- 都道府県別・月別平均客単価を求める
select
	pref.id as prefecture_id,
	pref.name as prefecture_name,
	date_format(o.order_time, '%Y%m') as order_year_month,
	round(avg(o.amount),0) as average_customer_spend
from
	orders o
inner join users u
on o.user_id = u.id
inner join prefectures as pref
	on u.prefecture_id = pref.id
group by
	prefecture_id,
    order_year_month
order by
	prefecture_id,
    order_year_month
;