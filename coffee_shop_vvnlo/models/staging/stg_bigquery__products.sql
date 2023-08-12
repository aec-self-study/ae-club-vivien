with 

source as (
    select * from {{ source('coffee_shop', 'products') }}
), 

renamed as (
    select
        -- ids
        id as product_id,
        -- strings
        name as product_name,
        category,
        -- timestamps
        created_at
    from source
)

select * from renamed