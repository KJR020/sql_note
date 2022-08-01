-- 足し算
select 10 + 3;
select 10 - 3;
select 10 / 3;
select 10 % 3;

-- null を含む演算は全てnullになる 
select 1 + null;
select 10 - null;
select 10 / null;
select 10 % null;

select abs(-10);

select round(0.443,2);  

select id, name, round(price * 1.08, 0) from products;

-- 文字列の演算
select concat(last_name, ' ', first_name, 'さん') from users;

select concat(last_name, 'さん, ',  email) from users where gender=2;

select concat(last_name, 'さん'), email from users where gender = 2;

-- 日付と時刻の演算
select current_date();
select current_timestamp();
select current_date() + interval 3 day;
select current_date() - interval 3 day;
select current_date() + interval 6 hour;
select current_date() - interval 6 hour; 
-- extract  
select * from orders where extract(year_month from order_time) = 201701;
select * from orders where extract(year from order_time) = 2017;
select * from orders where extract(month from order_time) = 1;