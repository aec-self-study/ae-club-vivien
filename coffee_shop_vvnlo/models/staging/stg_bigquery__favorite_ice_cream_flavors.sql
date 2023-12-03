with source as (
    select * from {{ source('advanced_dbt_examples', 'favorite_ice_cream_flavors') }}
),

renamed as (
    select
        github_username,
        favorite_ice_cream_flavor,
        created_at,
        updated_at
    from source

)

select * from renamed