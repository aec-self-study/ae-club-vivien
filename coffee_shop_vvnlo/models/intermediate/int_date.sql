{{
    config(materialized='table')
}}

select date(date_day) as date
from (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2020-12-27' as date)",
        end_date="date_add(current_date, INTERVAL 1 DAY)"
        )
    }}
)