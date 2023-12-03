{% snapshot favorite_ice_cream_flavors %}

{{ config(
    target_schema='dbt_vvnlo_snapshots',
    unique_key='github_username',
    strategy='timestamp',
    updated_at='updated_at'
) }}

select *
from {{ ref('stg_bigquery__favorite_ice_cream_flavors') }}

{% endsnapshot %}