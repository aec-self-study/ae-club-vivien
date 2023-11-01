{{
    config(materialized='table',
    cluster_by = "signup_month",
    )
}}

select date_trunc(first_order_at, month) signup_month, 
count(*) new_customers
from {{ ref('customers') }}
group by 1