{% test unique_mapping(model, column_name, map_by_column_name) %}

with id_mapped as (
  select {{ map_by_column_name }}, count(distinct {{ column_name }}) as mapped_ids
  from {{ model }}
  where {{ map_by_column_name }} is not null
  group by 1 
)
select *
from id_mapped
where mapped_ids > 1

{% endtest %}