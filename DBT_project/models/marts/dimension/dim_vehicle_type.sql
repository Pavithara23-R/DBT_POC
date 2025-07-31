select distinct
    make,
    model,
    model_year,
    electric_vehicle_type as vehicle_type,
    cafv_eligibility,
    electric_range,
    base_msrp,
    electric_utility,
    county,
    city,
    postal_code
from {{ ref('stg_ev') }}
where make is not null and model is not null
