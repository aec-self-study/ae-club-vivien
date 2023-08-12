with windowed as (
    select o.order_id,
    o.created_at,
    o.order_total,
    row_number() over (partition by o.customer_id order by o.created_at) order_cardinality
    from {{ ref('stg_bigquery__orders') }} o 
)

select EXTRACT(YEAR FROM created_at) as order_year,
EXTRACT(WEEK FROM created_at) as order_week,
sum(case when order_cardinality = 1 then order_total else 0 end) new_customer_revenue,
sum(case when order_cardinality > 1 then order_total else 0 end) returning_customer_revenue
from windowed
group by order_year, order_week
order by order_year, order_week
