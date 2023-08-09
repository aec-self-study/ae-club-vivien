with 

source as (
    select * from {{ source('coffee_shop', 'orders') }}
), 

renamed as (
    select
        -- ids
        id as order_id,
        customer_id,
        -- strings
        address as billing_address,
        state as billing_state,
        zip as billing_zip,
        -- numerics
        total as order_total,
        -- timestamps
        created_at
    from source
)

select * from renamed