with id_map as (
    select distinct 
        w.customer_id,
        w.visitor_id, 
        last_value(w.visitor_id) over (partition by w.customer_id order by web_tracking_ts desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as visitor_id_stitched
    from {{ ref('stg_bigquery__webtracking') }} w
    where w.customer_id is not null
)

select 
    w.web_tracking_id,
    ifnull(im.visitor_id_stitched, w.visitor_id) as visitor_id_stitched,
    w.customer_id,
    w.device_type,
    w.page,
    w.web_tracking_ts
from {{ ref('stg_bigquery__webtracking') }} w
left join id_map im on im.visitor_id = w.visitor_id