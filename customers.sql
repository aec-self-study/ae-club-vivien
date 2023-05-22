select o.customer_id,
c.name,
c.email,
min(o.created_at) as first_order_at,
count(distinct o.id) as number_of_orders
from  o
left join  c on o.customer_id = c.id
group by 1, 2, 3
order by min(o.created_at)
limit 5
