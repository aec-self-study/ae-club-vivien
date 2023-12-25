with last_pageview as (
    select
        web_tracking_id,
        visitor_id,
        customer_id,
        device_type,
        page,
        web_tracking_ts,
        lag(web_tracking_id) over (partition by visitor_id order by web_tracking_ts) as prev_web_tracking_id,
        lag(web_tracking_ts) over (partition by visitor_id order by web_tracking_ts) as prev_web_tracking_ts
    from {{ ref('stg_bigquery__webtracking') }}
),

new_sessions_flagged as (
    select
        web_tracking_id,
        visitor_id,
        customer_id,
        device_type,
        page,
        web_tracking_ts,
        prev_web_tracking_id,
        prev_web_tracking_ts,
        case when timestamp_diff(web_tracking_ts, prev_web_tracking_ts, minute) > 30 or prev_web_tracking_ts is null then 1 else 0 end as is_new_session
    from last_pageview
)

select
    web_tracking_id,
    visitor_id,
    customer_id,
    device_type,
    page,
    web_tracking_ts,
    prev_web_tracking_id,
    prev_web_tracking_ts,
    sum(is_new_session) over (order by visitor_id, web_tracking_ts) as session_id
from new_sessions_flagged