{%- set product_categories = dbt_utils.get_column_values(table=ref('int_item_sales'), column='product_category') %}

select
  date_trunc(sold_at, month) as date_month,
  {%- for product_category in product_categories %}
  sum(case when product_category = '{{ product_category }}' then amount end) as {{ product_category | replace(" ", "_") }}_amount
  {%- if not loop.last %},{% endif -%}
  {% endfor %}
from {{ ref('int_item_sales') }}
group by 1