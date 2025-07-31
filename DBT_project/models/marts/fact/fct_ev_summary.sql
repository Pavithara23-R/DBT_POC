select
    make,
    model,
    model_year,
    electric_vehicle_type as vehicle_type,
    count(*) as total_vehicles,
    avg(electric_range) as avg_range,
    avg(base_msrp) as avg_price,
    min(model_year) as earliest_year,
    max(model_year) as latest_year,
    county,
    city
from {{ ref('stg_ev') }}
where vin is not null
group by 
    make, model, model_year, electric_vehicle_type, county, city
