select EXTRACT(YEAR FROM o.created_at) order_year,
EXTRACT(WEEK FROM o.created_at) order_week,
p.category,
sum(pp.product_price) weekly_revenue
from {{ ref('stg_bigquery__orders') }} o 
left join {{ ref('stg_bigquery__orders') }} oi on o.order_id = oi.order_id
left join {{ ref('stg_bigquery__products') }} p on oi.product_id = p.product_id
left join {{ ref('stg_bigquery__product_prices') }} pp on p.product_id = pp.product_id and o.created_at >= pp.created_at and o.created_at < ifnull(pp.ended_at, cast('9999-12-31' as TIMESTAMP))
group by EXTRACT(YEAR FROM o.created_at), EXTRACT(WEEK FROM o.created_at), p.category
order by EXTRACT(YEAR FROM o.created_at), EXTRACT(WEEK FROM o.created_at), p.category
