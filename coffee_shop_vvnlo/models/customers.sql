{{ config(
    materialized='table'
) }}

select o.customer_id,
c.name,
c.email,
min(o.created_at) as first_order_at,
count(distinct o.id) as number_of_orders
from {{ source('coffee_shop', 'orders') }} o
left join {{ source('coffee_shop', 'customers') }} c on o.customer_id = c.id
-- from `analytics-engineers-club.coffee_shop.orders` o
-- left join `analytics-engineers-club.coffee_shop.customers` c on o.customer_id = c.id
group by 1, 2, 3
order by min(o.created_at)
