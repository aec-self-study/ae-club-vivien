select 
    o.order_id,
    o.customer_id,
    o.sold_at,
    oi.order_item_id,
    oi.product_id,
    p.product_name,
    p.product_category,
    pp.product_price as amount
from {{ ref('stg_bigquery__orders') }} o 
left join {{ ref('stg_bigquery__order_items') }} oi on o.order_id = oi.order_id
left join {{ ref('stg_bigquery__products') }} p on oi.product_id = p.product_id
left join {{ ref('stg_bigquery__product_prices') }} pp on p.product_id = pp.product_id and o.sold_at >= pp.started_at and o.sold_at < ifnull(pp.ended_at, cast('9999-12-31' as TIMESTAMP))