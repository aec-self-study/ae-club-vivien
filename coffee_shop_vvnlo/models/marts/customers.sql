{{ config(
    materialized='table'
) }}

select o.customer_id,
c.customer_name,
c.customer_email,
min(o.sold_at) as first_order_at,
count(distinct o.order_id) as number_of_orders
from {{ ref('stg_bigquery__orders') }} o
left join {{ ref('stg_bigquery__customers') }} c on o.customer_id = c.customer_id
-- from `analytics-engineers-club.coffee_shop.orders` o
-- left join `analytics-engineers-club.coffee_shop.customers` c on o.customer_id = c.id
group by 1, 2, 3
order by min(o.sold_at)
