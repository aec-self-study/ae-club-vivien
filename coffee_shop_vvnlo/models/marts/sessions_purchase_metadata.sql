with 
visitors_stitched as (
    select
        ps.web_tracking_id,
        us.visitor_id_stitched as visitor_id,
        ps.customer_id,
        ps.device_type,
        ps.page,
        ps.web_tracking_ts,
        ps.prev_web_tracking_ts,
        ps.session_id,
        ps.session_start_time,
        ps.session_end_time
    from {{ ref('int_pageview_sessions') }} ps
    left join {{ ref('int_user_stitching') }} us on us.web_tracking_id = ps.web_tracking_id
),

sessions_summary as (
    select distinct
        visitor_id,
        customer_id,
        session_id,
        session_start_time,
        session_end_time,
        timestamp_diff(session_end_time, session_start_time, second) as session_duration_sec,
        count(distinct page) as num_pages_visited
    from visitors_stitched
    group by
        visitor_id,
        customer_id,
        session_id,
        session_start_time,
        session_end_time,
        session_duration_sec
)

select
    s.visitor_id,
    s.customer_id,
    s.session_id,
    s.session_start_time,
    s.session_end_time,
    s.session_duration_sec,
    s.num_pages_visited,
    exists (select o.order_id from {{ ref('int_item_sales') }} o where s.customer_id = o.customer_id and o.sold_at >= s.session_start_time and o.sold_at <= s.session_end_time) as is_purchase
from sessions_summary s