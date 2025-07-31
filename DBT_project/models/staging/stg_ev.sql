-- models/staging/stg_ev.sql
select
    *,
    case 
        when electric_range = 0 then 'Unknown or Hybrid'
        when electric_range <= 100 then 'Short Range'
        when electric_range between 101 and 250 then 'Medium Range'
        when electric_range > 250 then 'Long Range'
    end as range_category
from {{ source('ev_source', 'electric_vehicles') }}
