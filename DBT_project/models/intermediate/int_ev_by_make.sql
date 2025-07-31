with ev_data as (
    select * from {{ ref('stg_ev') }}
)

select
    make,
    count(*) as total_vehicles
from ev_data
group by make
order by total_vehicles desc
