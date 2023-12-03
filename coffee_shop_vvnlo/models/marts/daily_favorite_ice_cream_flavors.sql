{%- set favorite_flavors = dbt_utils.get_column_values(table=ref('int_ice_cream_flavor_per_day'), column='favorite_ice_cream_flavor') %}

select
  date,
  {%- for favorite_ice_cream_flavor in favorite_flavors %}
  sum(case when favorite_ice_cream_flavor = '{{ favorite_ice_cream_flavor }}' then 1 end) as {{ favorite_ice_cream_flavor | replace(" ", "_") }}_user_count
  {%- if not loop.last %},{% endif -%}
  {% endfor %}
from {{ ref('int_ice_cream_flavor_per_day') }}
group by 1