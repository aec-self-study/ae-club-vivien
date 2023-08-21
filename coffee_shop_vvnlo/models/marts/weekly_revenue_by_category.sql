select EXTRACT(YEAR FROM sold_at) as order_year,
EXTRACT(WEEK FROM sold_at) as order_week,
product_category,
sum(amount) weekly_revenue
from {{ ref('int_item_sales') }}
group by order_year, order_week, product_category
order by order_year, order_week, product_category
