select EXTRACT(YEAR FROM o.created_at) as order_year,
EXTRACT(WEEK FROM o.created_at) as order_week,
p.category,
sum(pp.product_price) weekly_revenue
from {{ ref('stg_bigquery__orders') }} o 
left join {{ ref('stg_bigquery__order_items') }} oi on o.order_id = oi.order_id
left join {{ ref('stg_bigquery__products') }} p on oi.product_id = p.product_id
left join {{ ref('stg_bigquery__product_prices') }} pp on p.product_id = pp.product_id and o.created_at >= pp.created_at and o.created_at < ifnull(pp.ended_at, cast('9999-12-31' as TIMESTAMP))
group by order_year, order_week, p.category
order by order_year, order_week, p.category
