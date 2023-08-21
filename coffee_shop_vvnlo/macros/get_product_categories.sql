{% macro get_column_values(column_name, relation) %}

{% set relation_query %}
select distinct {{ column_name }}
from {{ relation }}
order by 1
{% endset %}

{% set results = run_query(relation_query) %}

{% if execute %}
-- return the first column
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}


{% macro get_product_categories() %}

{{ return(get_column_values('product_category', ref('int_item_sales'))) }}

{% endmacro %}