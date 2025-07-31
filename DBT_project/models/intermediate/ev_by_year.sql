with ev_data as (
    select * from {{ ref('stg_ev') }}
)

select
    model_year,
    count(*) as total_vehicles
from ev_data
group by model_year
order by model_year
