with 

source as (
    select * from {{ source('coffee_shop', 'product_prices') }}
), 

renamed as (
    select
        -- ids
        id as product_price_id,
        product_id,
        -- numerics
        price as product_price,
        -- timestamps
        created_at as started_at,
        ended_at
    from source
)

select * from renamed