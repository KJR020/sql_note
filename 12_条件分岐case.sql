use mydb;

select
	u.id as user_id,
    count(*) as num,
    case
		when count(*) >= 5 then 'A'
        when count(*) >= 2 then 'B'
        else 'C'
    end as user_rank
from
	users u
inner join 
	  orders o
on u.id = o.user_id
group by u.id
order by user_rank asc, user_id asc
;

-- nullを置き換える
select
	p.id,
    p.name,
    case
		when sum(od.product_qty) is null then 0
        else sum(od.product_qty) 
    end as num
from
	products p
left outer join
	order_details od
on p.id = od.product_id
group by p.id;

-- case　演習
select
	p.id,
    p.name,
    case
		when sum(od.product_qty) is null then 0
        else sum(od.product_qty) 
    end as total_qty,
    case
		when sum(od.product_qty) >= 20 then 'A'
        when sum(od.product_qty) >= 10 then 'B'
        else 'C'
	end as p_rank
from 
	products as p
left outer join
	order_details as od
on p.id = od.product_id
group by p.id
order by p_rank, p.id
;

	