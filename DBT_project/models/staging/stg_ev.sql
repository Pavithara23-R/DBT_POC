-- models/staging/stg_ev.sql
SELECT
    vin,
    {{ clean_text('make') }} AS make,
    {{ clean_text('model') }} AS model,
    model_year,
    {{ clean_text('electric_vehicle_type') }} AS electric_vehicle_type,
    electric_range,
    {{ clean_text('city') }} AS city,
    {{ clean_text('state') }} AS state,
    {{ clean_text('postal_code') }} AS postal_code,
    {{ clean_text('county') }} AS county,
    {{ clean_text('electric_utility') }} AS electric_utility,
   cafv_eligibility,
   base_msrp,
    CASE 
        WHEN electric_range = 0 THEN 'Unknown or Hybrid'
        WHEN electric_range <= 100 THEN 'Short Range'
        WHEN electric_range BETWEEN 101 AND 250 THEN 'Medium Range'
        WHEN electric_range > 250 THEN 'Long Range'
    END AS range_category

FROM {{ source('ev_source', 'electric_vehicles') }}



