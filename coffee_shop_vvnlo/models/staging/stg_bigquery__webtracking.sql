with source as (
    select * from {{ source('web_tracking', 'pageviews') }}
),

renamed as (
    select
        -- ids
        id as web_tracking_id,
        visitor_id,
        customer_id,
        -- strings
        device_type,
        page,
        -- timestamps
        timestamp as web_tracking_ts
    from source
)

select * from renamed