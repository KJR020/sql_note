select * from orders;

select
	sum(amount)
from
	orders
where
	order_time >= '2017-01-01 00:00:00'
    and order_time <= '2017-02-01 00:00:00';

select
	avg(price)
from
	products;
    
-- min　集約関数
select min(price) from products;

--  max 集約関数
select max(price) from products;

-- count 集約関数
select count(*) from users;
select count(*) from users where gender= 2;

-- select * from access_logs;
select * from access_logs where request_month = '2017-01-01';
select count(distinct user_id) from access_logs where request_month = '2017-01-01';

-- groupby
select prefecture_id, count(*) from users group by prefecture_id; 

select request_month, count(distinct user_id) from  access_logs where request_month >= '2017-01-01' and request_month <  '2018-01-01' group by request_month having count(distinct user_id) >= 630;

SELECT * FROM mydb.users;
use mydb;

select * from access_logs;
select * from access_logs 
where 
	request_month >= '2017-01-01' 
    and request_month < '2017-02-01';
    
select request_month,count(*) from access_logs group by request_month;

select request_month,count(*) from access_logs group by request_month having count(*) >= 1000;
