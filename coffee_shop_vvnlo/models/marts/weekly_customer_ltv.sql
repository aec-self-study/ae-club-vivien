with weekly_orders as (
    select
        customer_id,
        date(date_trunc(sold_at, week)) as sold_at_week,
        sum(amount) as revenue
    from {{ ref('int_item_sales') }}
    group by
        customer_id,
        sold_at_week
),

 customer_lifetime_start as (
    select
        customer_id,
        min(sold_at_week) as first_sale_week
    from weekly_orders
    group by customer_id
),

generate_weeks as (
    select
        c.customer_id,
        c.first_sale_week,
        dw.date_week,
        date_diff(dw.date_week, c.first_sale_week, week) as week_number
    from {{ ref('int_date_week') }} dw
    join customer_lifetime_start c on c.first_sale_week <= dw.date_week
)

select
    g.customer_id,
    g.first_sale_week,
    g.date_week,
    g.week_number,
    ifnull(w.revenue, 0) as weekly_revenue,
    sum(ifnull(w.revenue, 0)) over (partition by g.customer_id order by g.week_number) as cumulative_revenue
from generate_weeks g
left join weekly_orders w on w.customer_id = g.customer_id and g.date_week = w.sold_at_week