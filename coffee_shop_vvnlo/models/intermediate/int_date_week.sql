{{
    config(materialized='table')
}}

select date(date_week) as date_week
from (
    {{ dbt_utils.date_spine(
        datepart="week",
        start_date="cast('2020-12-27' as date)",
        end_date="date_add(current_date, INTERVAL 1 DAY)"
        )
    }}
)