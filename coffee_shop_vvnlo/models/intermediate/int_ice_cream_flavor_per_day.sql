select 
    d.date,
    ics.github_username,
    replace(ics.favorite_ice_cream_flavor, "'", "") favorite_ice_cream_flavor,
    ics.dbt_scd_id,
    ics.dbt_valid_from,
    ics.dbt_valid_to
from {{ ref('int_date') }} d
left join {{ ref('favorite_ice_cream_flavors') }} ics on ics.dbt_valid_from <= cast(d.date as timestamp) and ifnull(ics.dbt_valid_to, cast('9999-12-31' as TIMESTAMP)) >= timestamp_add(cast(d.date as timestamp), INTERVAL 1 DAY)


